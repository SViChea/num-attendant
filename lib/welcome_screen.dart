import 'package:flutter/material.dart';
import 'package:num_attendant/login_screen.dart';
import 'dart:async';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin(); // Call the navigation function directly
  }

  void _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 5)); // Delay for 2 seconds
    if (mounted) {
      // Check if the widget is still in the tree
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF162534),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/Logo copy.png',
              width: 190,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 25),
            const Text(
              "WELCOME NUM Attendance",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}