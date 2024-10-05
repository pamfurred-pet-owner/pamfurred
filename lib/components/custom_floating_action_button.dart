import 'package:flutter/material.dart';
import 'package:pamfurred/components/globals.dart';

Widget customFloatingActionButton(BuildContext context,
    {required String buttonText, required VoidCallback onPressed}) {
  const double elevatedButtonHeight = 50;
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(secondaryBorderRadius),
      border: Border.all(width: 0.5, color: primaryColor),
      color: primaryColor,
    ),
    height: elevatedButtonHeight,
    margin: const EdgeInsets.all(primarySizedBox),
    child: TextButton(
      onPressed: onPressed,
      child: Center(
        child: Text(
          buttonText,
          style: const TextStyle(
              color: Colors.white,
              fontSize: regularText,
              fontWeight: regularWeight),
        ),
      ),
    ),
  );
}
