import 'package:flutter/material.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/pages/auth/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});
  static String id = 'StartPage';

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
 
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, LoginPage.id);
        },
        child: Stack(
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
        ),
      ),
    );
  }
}
