
import 'package:flutter/material.dart';

// ignore: camel_case_types
class customIconButton extends StatelessWidget {
  const customIconButton({
    super.key,
     required this.icon, this.onPressed,
  });
  final Widget icon;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Positioned(
 
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
