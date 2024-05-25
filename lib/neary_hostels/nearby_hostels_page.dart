import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NearbyHostelsPage extends StatefulWidget {
  @override
  _NearbyHostelsPageState createState() => _NearbyHostelsPageState();
}

class _NearbyHostelsPageState extends State<NearbyHostelsPage> {
  LocationData? _currentLocation;
  final Location _location = Location();
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    final locationData = await _location.getLocation();
    setState(() {
      _currentLocation = locationData;
    });
    _fetchHostels();
  }

  void _fetchHostels() async {
    if (_currentLocation == null) return;

    FirebaseFirestore.instance.collection('hostels').get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        final data = doc.data();
        final GeoPoint location = data['location'];
        setState(() {
          _markers.add(
            Marker(
              markerId: MarkerId(doc.id),
              position: LatLng(location.latitude, location.longitude),
              infoWindow: InfoWindow(title: data['Title']),
            ),
          );
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentLocation == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Nearby Hostels'),
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Hostels'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
          zoom: 14,
        ),
        markers: _markers,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}