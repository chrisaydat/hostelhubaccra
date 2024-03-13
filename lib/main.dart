// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hostelhubaccra/features/home/homescreen.dart';
import 'package:hostelhubaccra/features/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HostelHubAccra',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal.shade100),
        useMaterial3: true,
      ),
      home: OnboardingScreen(),
      routes: {
'/home':(context) => HomeScreen(),
      },
    );
  }
}

