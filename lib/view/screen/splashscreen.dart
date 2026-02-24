import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movies_project_api/core/app_color.dart';
import 'package:movies_project_api/view/screen/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homescreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColor.splashGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Spacer(),

            Text(
              "MovieHub",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Colors.red,
                letterSpacing: 2,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "UNLIMITED MOVIES, TV SHOWS & MORE",
              style: TextStyle(color: Colors.white70, letterSpacing: 1.5),
            ),

            Spacer(),

            CircularProgressIndicator(color: Colors.red),

            SizedBox(height: 40),

            Text(
              "PREMIUM CINEMATIC HUB",
              style: TextStyle(color: Colors.white54),
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
