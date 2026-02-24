import 'package:flutter/material.dart';
import 'package:movies_project_api/view/screen/homescreen.dart';
import 'package:movies_project_api/view/screen/splashscreen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}