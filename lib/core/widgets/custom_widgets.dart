








import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String massage) {
  
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(massage.replaceAll('-', '')),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.black,
    ));
  }


  
  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
