// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_element, no_leading_underscores_for_local_identifiers, unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelhubaccra/components/navbar/bottom_navigation_bar.dart';
import 'package:hostelhubaccra/components/parallex/parallex_widget.dart';
import 'package:hostelhubaccra/features/hostel_list/hostel_list_page.dart';
import 'package:hostelhubaccra/features/onboarding/onboarding_screen.dart';
import 'package:hostelhubaccra/features/search/search_page.dart';
import 'package:hostelhubaccra/features/settings/profile_settings.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hostelhubaccra/features/settings/settings_page.dart';
import 'package:location/location.dart';
import 'package:hostelhubaccra/neary_hostels/nearby_hostels_page.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  TextEditingController _searchController = TextEditingController();
  Stream<QuerySnapshot>? _stream;
  LocationData? _currentLocation;
  Location _location = Location();
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    _stream = FirebaseFirestore.instance.collection('hostels').snapshots();
    _getLocation();
  }

  void _search() {
    String searchText = _searchController.text.trim();
    setState(() {
      _stream = FirebaseFirestore.instance
          .collection('hostels')
          .where('Title', isEqualTo: searchText)
          .snapshots();
    });
  }

  Future<void> _getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentLocation = await _location.getLocation();
    if (_mapController != null) {
      _mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
            zoom: 14,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => NearbyHostelsPage()),
          //     );
          //   },
          //   icon: Icon(CupertinoIcons.bell),
          // ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileSettings()),
                );
              },
              icon: CircleAvatar(
                backgroundColor: Colors.amber,
                backgroundImage: AssetImage('assets/images/default-avatar-profile-icon-social-600nw-1677509740.jpg.webp'),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Back',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ",Ransford ",
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ParallaxEffect(),
              Container(
                padding: EdgeInsets.all(15.0),
                height: 300,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: GoogleMap(
                        onMapCreated: (controller) {
                          _mapController = controller;
                          if (_currentLocation != null) {
                            _mapController!.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
                                  zoom: 14,
                                ),
                              ),
                            );
                          }
                        },
                        initialCameraPosition: CameraPosition(
                          target: LatLng(5.6037, -0.1870), // Default position
                          zoom: 12,
                        ),
                        markers: {
                          Marker(
                            markerId: MarkerId('1'),
                            position: LatLng(5.6037, -0.1870),
                          ),
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NearbyHostelsPage()),
                        );
                      },
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            switch (index) {
              case 0:
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HostelsList()),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
                break;
            }
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}