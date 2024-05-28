// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class NearbyHostelsPage extends StatefulWidget {
  @override
  _NearbyHostelsPageState createState() => _NearbyHostelsPageState();
}

class _NearbyHostelsPageState extends State<NearbyHostelsPage> {
  LocationData? _currentLocation;
  final Location _location = Location();
  Set<Marker> _markers = {};
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
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
        });
        return;
      }
    }
    _getCurrentLocation();
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
      });
    }
  }

  void _fetchHostels() {
    if (_currentLocation == null) return;

    // Hardcoded list of hostels
    List<Map<String, dynamic>> hostels = 
[
    {
        "Title": "Pink Hostel",
        "location": {
            "latitude": 5.5845,
            "longitude": -0.1959
        }
    },
    {
        "Title": "Niagara Inn",
        "location": {
            "latitude": 5.5904,
            "longitude": -0.1958
        }
    },
    {
        "Title": "Osu Oxford Street Hostel",
        "location": {
            "latitude": 5.5553,
            "longitude": -0.1826
        }
    },
    {
        "Title": "Jubilee Chalets",
        "location": {
            "latitude": 5.5878,
            "longitude": -0.2132
        }
    },
    {
        "Title": "The Sleepy Hippo Hotel",
        "location": {
            "latitude": 5.6063,
            "longitude": -0.1941
        }
    },
    {
        "Title": "Bamboo House Hostel",
        "location": {
            "latitude": 5.5835,
            "longitude": -0.1888
        }
    },
    {
        "Title": "Osu Homestay",
        "location": {
            "latitude": 5.5553,
            "longitude": -0.1826
        }
    },
    {
        "Title": "Pink Hostel Annex",
        "location": {
            "latitude": 5.5843,
            "longitude": -0.1958
        }
    },
    {
        "Title": "Sleepy Hippo Backpackers",
        "location": {
            "latitude": 5.5845,
            "longitude": -0.1959
        }
    },
    {
        "Title": "Accra Luxury Lodge",
        "location": {
            "latitude": 5.5899,
            "longitude": -0.1778
        }
    },
    {
        "Title": "Akuafo Hall Hostel (University of Ghana, Legon)",
        "location": {
            "latitude": 5.6425,
            "longitude": -0.1855
        }
    },
    {
        "Title": "International Students Hostel (University of Ghana, Legon)",
        "location": {
            "latitude": 5.6416,
            "longitude": -0.1856
        }
    },
    {
        "Title": "Okuafo Pa Hostel (University of Ghana, Legon)",
        "location": {
            "latitude": 5.6452,
            "longitude": -0.1868
        }
    },
    {
        "Title": "Akuaffo Hostel (University of Ghana, Legon)",
        "location": {
            "latitude": 5.6414,
            "longitude": -0.1845
        }
    },
    {
        "Title": "Wisconsin Hall (GIMPA)",
        "location": {
            "latitude": 5.6419,
            "longitude": -0.1741
        }
    },
    {
        "Title": "Hostel City (GIMPA)",
        "location": {
            "latitude": 5.6431,
            "longitude": -0.1745
        }
    },
    {
        "Title": "Tetteh Quarshie Hostel (GIMPA)",
        "location": {
            "latitude": 5.6423,
            "longitude": -0.1769
        }
    },
    {
        "Title": "GIMPA Staff Village Hostel (GIMPA)",
        "location": {
            "latitude": 5.6421,
            "longitude": -0.1758
        }
    },
    {
        "Title": "Kojo Minta Hostel (GIMPA)",
        "location": {
            "latitude": 5.6417,
            "longitude": -0.1754
        }
    },
    {
        "Title": "Emmanuel Hostel (GIMPA)",
        "location": {
            "latitude": 5.6415,
            "longitude": -0.1748
        }
    },
    {
        "Title": "Ses Hall (University of Ghana, Legon)",
        "location": {
            "latitude": 5.6413,
            "longitude": -0.1846
        }
    },
    {
        "Title": "Rebecca Hall (University of Ghana, Legon)",
        "location": {
            "latitude": 5.6413,
            "longitude": -0.185
        }
    },
    {
        "Title": "Akuafo Annex B (University of Ghana, Legon)",
        "location": {
            "latitude": 5.6415,
            "longitude": -0.1843
        }
    },
    {
        "Title": "Sarbah Hall (University of Ghana, Legon)",
        "location": {
            "latitude": 5.6411,
            "longitude": -0.1855
        }
    },
    {
        "Title": "Akuafo Annex C (University of Ghana, Legon)",
        "location": {
            "latitude": 5.6415,
            "longitude": -0.1842
        }
    },
    {
        "Title": "Ugmaa Hostel (University of Ghana, Legon)",
        "location": {
            "latitude": 5.6418,
            "longitude": -0.1863
        }
    },
    {
        "Title": "African Studies (University of Ghana, Legon)",
        "location": {
            "latitude": 5.6412,
            "longitude": -0.1834
        }
    },
    {
        "Title": "Bani Hall (University of Ghana, Legon)",
        "location": {
            "latitude": 5.6414,
            "longitude": -0.1839
        }
    },
    {
        "Title": "Akuafo Annex A (University of Ghana, Legon)",
        "location": {
            "latitude": 5.6415,
            "longitude": -0.1841
        }
    }

    ];

    setState(() {
      _markers = hostels.map((hostel) {
        final GeoPoint location = hostel['location'];
        return Marker(
          markerId: MarkerId(hostel['Title']),
          position: LatLng(location.latitude, location.longitude),
          infoWindow: InfoWindow(title: hostel['Title']),
        );
      }).toSet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Hostels'),
      ),
      body: _errorMessage.isNotEmpty
          ? Center(child: Text(_errorMessage))
          : GoogleMap(
              initialCameraPosition: _currentLocation != null
                  ? CameraPosition(
                      target: LatLng(
                          _currentLocation!.latitude!, _currentLocation!.longitude!),
                      zoom: 14,
                    )
                  : const CameraPosition(
                      target: LatLng(5.6037, -0.1870),
                      zoom: 1,
                    ),
              markers: _markers,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),
    );
  }
}