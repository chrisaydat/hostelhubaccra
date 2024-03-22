// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_super_parameters, unused_import

import 'package:flutter/material.dart';
import 'package:hostelhubaccra/auth/login_register.dart';
import 'package:hostelhubaccra/features/home/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 300, 
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/Best-Universities-in-Ghana.jpg'),
                radius: 220,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 300, 
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/DJI_0021-1024x575.jpg'),
                    radius: 180,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: () {
                      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SimpleLoginScreen()),
                      );
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Colors.teal,
                    ),
                    child: Text('Get Started',
                    style: TextStyle(
                      color: Colors.black,
                    ),)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
