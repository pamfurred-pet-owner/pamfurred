import 'package:flutter/material.dart';
import 'globals.dart';

Text customHeaderText(BuildContext context, String text) {
  return Text(text,
      style: const TextStyle(fontSize: headerText, fontWeight: mediumWeight));
}
