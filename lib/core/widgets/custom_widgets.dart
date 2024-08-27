import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';

void showSnackbar(
  BuildContext context,
  String massage,
) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      massage.replaceAll('-', ''),
      style: TextStyle(
          color:
              isDarkMode ? Colors.white : blueColor), // Set the text color here
    ),
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.black,
  ));
}

Widget buildSectionTitle(String title) {
  return Text(
    title,
    style: TextStyle(
      fontSize: 22,
      color: blueColor,
      fontWeight: FontWeight.bold,
    ),
  );
}
