import 'package:flutter/material.dart';
import 'package:movies_project_api/view/screen/favorite.dart';
import 'package:movies_project_api/view/screen/homeserch.dart';
import 'homescreen.dart';


class Bottombarscreen extends StatefulWidget {
  const Bottombarscreen({super.key});

  @override
  State<Bottombarscreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<Bottombarscreen> {

  int currentIndex = 0;

  final List<Widget> pages = const [
    Homescreen(),
    Homeserch(),
    Favorite(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
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
  }
}