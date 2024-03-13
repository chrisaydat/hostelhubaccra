// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.white, // Customize background color as needed
      selectedItemColor: Colors.black, // Customize selected item color
      unselectedItemColor: Colors.grey, // Customize unselected item color
      type: BottomNavigationBarType.fixed, // Ensure all items are displayed
      items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.building_2_fill),
          label: 'Hostels',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.settings),
          label: 'Settings',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(CupertinoIcons.person),
        //   label: 'Profile',
        // ),
      ],
    );
  }
}
