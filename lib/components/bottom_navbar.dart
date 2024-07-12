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
          icon: const Icon(
            Icons.home,
            size: 30,
          ),
          title: const Text(
            "Home",
            style: TextStyle(fontSize: regularText),
          ),
          selectedColor: primaryColor,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: const Icon(
            Icons.calendar_month,
            size: 30,
          ),
          title: const Text(
            "Appointments",
            style: TextStyle(fontSize: regularText),
          ),
          selectedColor: primaryColor,
        ),

        /// Search
        SalomonBottomBarItem(
          icon: const Icon(
            CupertinoIcons.bell_fill,
            size: 30,
          ),
          title: const Text(
            "Notifications",
            style: TextStyle(fontSize: regularText),
          ),
          selectedColor: primaryColor,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: const Icon(
            Icons.person,
            size: 30,
          ),
          title: const Text(
            "Profile",
            style: TextStyle(fontSize: regularText),
          ),
          selectedColor: primaryColor,
        ),
      ],
    );
  }
}
