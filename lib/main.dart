import 'package:flutter/material.dart';
import 'package:movies_project_api/controller/bottombar_controller.dart';
import 'package:movies_project_api/controller/favorite_controller.dart';
import 'package:movies_project_api/controller/serch_controller.dart';
import 'package:movies_project_api/view/screen/homescreen.dart';
import 'package:movies_project_api/view/screen/splashscreen.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(MultiProvider(providers:[
     ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
  ],child:  MyApp()));
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