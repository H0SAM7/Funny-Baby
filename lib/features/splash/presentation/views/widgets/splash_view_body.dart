
import 'package:flutter/material.dart';
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
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Images/start.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                s.funny,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.lalezar().fontFamily,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 5), // Use `height` for vertical spacing
              Text(
                s.baby,
                style: TextStyle(
                  color: const Color.fromARGB(255, 247, 109, 233),
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.lalezar().fontFamily,
                  fontSize: 50,
                ),
              ),
            ],
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
              color: Colors.white,
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
