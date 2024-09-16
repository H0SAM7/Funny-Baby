import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/utils/assets.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashviewBody extends StatelessWidget {
  const SplashviewBody({
    super.key,
    required this.size,
    required this.s,
  });

  final Size size;
  final S s;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.none,
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage(Assets.imagesStartLogo2),
              //   fit: BoxFit.contain,
              // ),
              ),
          child: Image.asset(
            Assets.imagesStartLogo2,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          bottom: 20, // Adjust as needed
          left: 0,
          right: 0,
          child: Text(
            s.tap_statrt,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: funnyBlueColor,
              fontFamily: GoogleFonts.lalezar().fontFamily,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
