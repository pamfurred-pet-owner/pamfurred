import 'package:flutter/material.dart';

// --App Bar--
// 1) App Bar custom UI
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

// fontSize
const double regularText = 15;
const double titleFont = 25;
const double headerText = 18;

// fontWeight
const boldWeight = FontWeight.w900;
const mediumWeight = FontWeight.w600;

// Colors
const primaryColor = Color.fromRGBO(160, 62, 6, 1.0);
const secondaryColor = Color.fromRGBO(255, 137, 29, 1.0);
const greyColor = Color.fromRGBO(83, 83, 83, 1);
const lightGreyColor = Color.fromRGBO(241, 241, 241, 1);

// Textfields/Textformfields
const double primaryTextFieldHeight = 40;

// Padding
const primaryPadding = EdgeInsets.fromLTRB(35, 0, 35, 0);

// SizedBox
const double primarySizedBox = 8;
const double secondarySizedBox = 16;
const double tertiarySizedBox = 24;

// BorderRadius
const double primaryBorderRadius = 5;
const double secondaryBorderRadius = 10;

// Variables requiring device width
double deviceWidthDivideOnePointFive(BuildContext context) {
  return MediaQuery.of(context).size.width / 1.5;
}

// --Screen transitions--
// 1) Slide in:
Route rightToLeftRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

// 2) Crossfade:
Route crossFadeRoute(Widget nextPage) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => nextPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = 0.0;
      var end = 1.0;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return FadeTransition(
        opacity: animation.drive(tween),
        child: child,
      );
    },
  );
}