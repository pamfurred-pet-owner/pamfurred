import 'package:flutter/material.dart';
import 'globals.dart';

Widget customPaddedTextButton({
  required String text,
  required VoidCallback onPressed,
}) {
  return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(secondaryBorderRadius),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          primaryColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: regularText,
          ),
        ),
      ));
}


Widget customPaddedOutlinedTextButton({
  required String text,
  required VoidCallback onPressed,
}) {
  return TextButton(
    onPressed: onPressed,
    style: ButtonStyle(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(secondaryBorderRadius),
          side: const BorderSide(color: primaryColor), // Set the border side here
        ),
      ),
      padding: WidgetStateProperty.all<EdgeInsets>(
        const EdgeInsets.all(10.0), // Customize the padding as needed
      ),
    ),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: regularText,
        color: primaryColor,
      ),
    ),
  );
}
