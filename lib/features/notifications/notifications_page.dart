// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  NotificationsPage ({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: 
            IconButton(onPressed: null, icon: Icon(Icons.arrow_back_ios)),
          elevation: 0.5,
          backgroundColor: Colors.white,
          title: Text('Notifications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),),
        ),
        body: ListView(),
        ),
    );
  }

}