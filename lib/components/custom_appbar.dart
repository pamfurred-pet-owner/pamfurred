import 'package:flutter/material.dart';
import 'package:pamfurred/components/globals.dart';

// 1) appBar
// Primarily for homescreen
AppBar appBar(BuildContext context) {
  return AppBar(
    shape: const Border.symmetric(horizontal: BorderSide(width: .1)),
    backgroundColor: Colors.white,
    toolbarHeight: 85,
    leadingWidth: 190,
    leading: Padding(
      padding: const EdgeInsets.fromLTRB(15, 35, 0, 10),
      child: SizedBox(
        child: Image.asset(
          'assets/pamfurred_logo.png',
          fit: BoxFit.fill,
        ),
      ),
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.fromLTRB(10, 35, 15, 10),
        child: Icon(Icons.settings),
      ),
    ],
  );
}

// 2) customAppBar
// This is for other screens but homescreen
AppBar customAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    toolbarHeight: 60,
    leading: Padding(
      padding: const EdgeInsets.all(20.0),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () {
          // Custom action on back button press
          Navigator.pop(context);
        },
      ),
    ),
  );
}
