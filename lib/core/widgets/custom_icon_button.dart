
import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';

// ignore: camel_case_types
class customIconButton extends StatelessWidget {
  const customIconButton({
    super.key,
    required this.size, required this.icon, this.onPressed,
  });
  final Widget icon;
  final Size size;
 final void Function()? onPressed;
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
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
