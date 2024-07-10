import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pamfurred/components/globals.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomNavBar extends StatefulWidget {
  final BuildContext context;

  const CustomBottomNavBar(this.context, {super.key});

  @override
  CustomBottomNavBarState createState() => CustomBottomNavBarState();
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: currentIndex,
      onTap: (i) => setState(() => currentIndex = i),
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          title: const Text("Home"),
          selectedColor: primaryColor,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: const Icon(Icons.calendar_month),
          title: const Text("Appointments"),
          selectedColor: primaryColor,
        ),

        /// Search
        SalomonBottomBarItem(
          icon: const Icon(CupertinoIcons.bell_fill),
          title: const Text("Notifications"),
          selectedColor: primaryColor,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: const Icon(Icons.person),
          title: const Text("Profile"),
          selectedColor: primaryColor,
        ),
      ],
    );
  }
}
