import 'package:flutter/material.dart';
import 'globals.dart';

Text customTitleText(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: titleFont, fontWeight: mediumWeight),
  );
}

Text customRegularWeightTitleText(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: regularText, fontWeight: regularWeight),
  );
}

Text customBoldWeightRegularText(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(fontSize: regularText, fontWeight: boldWeight),
  );
}
// custom title text with primary color and medium font weight
Text customTitleTextWithPrimaryColor(BuildContext context, String text) {
  return Text(text,
      style: const TextStyle(
          fontSize: titleFont, fontWeight: mediumWeight, color: primaryColor));
}
