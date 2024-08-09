
import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';

// ignore: camel_case_types
class customArrowButton extends StatelessWidget {
  const customArrowButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.05,
      left: size.width * 0.05,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(15),
        ),
        child: IconButton(
          icon: Icon(Icons.arrow_forward, color: blueColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }
}
