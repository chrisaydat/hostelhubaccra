// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_final_fields

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
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
    _getCurrentLocation();
  }

  void _requestLocationPermission() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        setState(() {
          _errorMessage = 'Location services are disabled.';
          _isLoading = false;
        });
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        setState(() {
          _errorMessage = 'Location permissions are denied.';
          _isLoading = false;
        });
        return;
      }
    }
  }

  void _getCurrentLocation() async {
    try {
      final locationData = await _location.getLocation();
      setState(() {
        _currentLocation = locationData;
      });
      _fetchHostels();
    } catch (e) {
      setState(() {
        _errorMessage = 'Error getting location: $e';
        _isLoading = false;
      });
    }
  }

  void _fetchHostels() async {
    if (_currentLocation == null) return;

    try {
      FirebaseFirestore.instance.collection('hostels').get().then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          final data = doc.data() as Map<String, dynamic>;
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
        setState(() {
          _isLoading = false;
        });
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error fetching hostels: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Hostels'),
      ),
      body: _isLoading
          ? Center(child: Text('Loading...'))
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage))
              : _currentLocation == null
                  ? Center(child: Text('Failed to get current location.'))
                  : GoogleMap(
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