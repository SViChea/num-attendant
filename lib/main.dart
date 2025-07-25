import 'package:flutter/material.dart';
import 'package:num_attendant/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

// The root of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(), // Set AccountScreen as the home screen
    );
  }
}
