// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:hostelhubaccra/auth/login_register.dart';
import 'package:hostelhubaccra/features/home/homescreen.dart';
import 'package:hostelhubaccra/features/hostel_list/hostels_details_page.dart';
import 'package:hostelhubaccra/features/onboarding/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hostelhubaccra/features/settings/settings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    runApp(MyApp());
  } catch (e) {
    runApp(ErrorApp(e));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/home': (context) => HomeScreen(),
        '/login': (context) => SimpleLoginScreen(),
      },
    );
  }
}

class ErrorApp extends StatelessWidget {
  final Object error;

  ErrorApp(this.error);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Error initializing Firebase: $error'),
        ),
      ),
    );
  }
}