import 'package:flutter/material.dart';
import 'package:funny_baby/features/auth/presentation/views/login_page.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/features/splash/presentation/views/widgets/splash_view_body.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static String id = 'SplashView';

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
 
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, LoginPage.id);
        },
        child: SplashviewBody(size: size, s: s),
      ),
    );
  }
}
