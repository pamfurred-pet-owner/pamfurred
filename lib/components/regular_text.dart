import 'package:flutter/material.dart';
import 'package:pamfurred/components/globals.dart';

Widget regularTextWidget(String text) {
  return Flexible(
    child: Text(
      maxLines: 2,
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: regularText,
        fontWeight: regularWeight,
      ),
    ),
  );
}

Widget regularGreyTextWidget(String text) {
  return Flexible(
    child: Text(
      maxLines: 2,
      text,
      style: const TextStyle(
        color: darkGreyColor,
        fontSize: regularText,
        fontWeight: regularWeight,
      ),
    ),
  );
}