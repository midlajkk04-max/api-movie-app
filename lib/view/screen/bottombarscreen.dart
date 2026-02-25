import 'package:flutter/material.dart';
import 'package:movies_project_api/controller/bottombar_controller.dart';
import 'package:movies_project_api/view/screen/favoritescreen.dart';
import 'package:movies_project_api/view/screen/homescreen.dart';
import 'package:movies_project_api/view/screen/movieserch.dart';
import 'package:provider/provider.dart';

class Bottombarscreen extends StatelessWidget {
  const Bottombarscreen({super.key});

  final List<Widget> pages = const [
    Homescreen(),
    Movieserch(),
    Favoritescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, nav, child) {
        return Scaffold(
          body: pages[nav.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
            currentIndex: nav.currentIndex,
            onTap: nav.changeIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favorite",
              ),
            ],
          ),
        );
      },
    );
  }
}