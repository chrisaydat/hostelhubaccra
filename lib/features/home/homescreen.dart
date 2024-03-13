// ignore_for_file: library_private_types_in_public_api, use_super_parameters, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostelhubaccra/components/navbar/bottom_navigation_bar.dart';
import 'package:hostelhubaccra/components/parallex/parallex_widget.dart';
import 'package:hostelhubaccra/features/hostel_list/hostel_list_page.dart';
import 'package:hostelhubaccra/features/onboarding/onboarding_screen.dart';
import 'package:hostelhubaccra/features/settings/profile_settings.dart';
import 'package:hostelhubaccra/features/settings/settings_page.dart';

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
              // Add functionality for the bell icon here
              // For example, open notifications screen
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
                // Add functionality for the circular avatar icon here
                // For example, open user profile screen
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
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            // Handle navigation based on index
            switch (index) {
              case 0:
                // Navigate to Home screen
                // You are already on the Home screen, so no navigation needed
                break;
              case 1:
                // Navigate to Hostels screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HostelsList()),
                );
                break;
              case 2:
                // Navigate to Settings screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
                break;
              // Add more cases for additional screens
              // case 3:
              //   // Navigate to Profile screen
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => ProfileScreen()),
              //   );
              //   break;
            }
          },
        ),
      ),
    );
  }
}
