import 'package:flutter/material.dart';
import 'globals.dart';

Text customTitleText(BuildContext context, String text) {
  return Text(text,
      style: const TextStyle(fontSize: titleFont, fontWeight: mediumWeight));
}

Text customTitleTextWithPrimaryColor(BuildContext context, String text) {
  return Text(text,
      style: const TextStyle(
          fontSize: titleFont, fontWeight: mediumWeight, color: primaryColor));
}
