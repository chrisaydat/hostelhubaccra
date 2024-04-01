// ignore_for_file: unused_field, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelhubaccra/components/navbar/bottom_navigation_bar.dart';
import 'package:hostelhubaccra/components/parallex/parallex_widget.dart';
import 'package:hostelhubaccra/features/hostel_list/hostel_list_page.dart';
import 'package:hostelhubaccra/features/onboarding/onboarding_screen.dart';
import 'package:hostelhubaccra/features/search/search_page.dart';
import 'package:hostelhubaccra/features/settings/profile_settings.dart';
import 'package:hostelhubaccra/features/settings/settings_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import'package:cloud_firestore/cloud_firestore.dart';


void main() {
  runApp(MyApp());
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  TextEditingController _searchController = TextEditingController();
  Stream<QuerySnapshot>? _stream;

  @override
  void initState() {
    super.initState();
    _stream = FirebaseFirestore.instance.collection('hostels').snapshots();
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileSettings()),
              );
            },
            icon: Icon(CupertinoIcons.bell),
          ),
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
                backgroundImage: AssetImage('assets/images/image.png'),
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
                    Row(
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
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ParallaxEffect(),
               Container(
  padding: EdgeInsets.all(15.0),
  height: 300, 
  child: ClipRRect(
    borderRadius: BorderRadius.circular(15.0), 
    child: GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(5.6037, -0.1870), 
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
)

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
