import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:num_attendant/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
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
