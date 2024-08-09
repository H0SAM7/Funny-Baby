import 'package:flutter/material.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/pages/auth/login_page.dart';
import 'package:funny_baby/widgets/start_page_body.dart';


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
        child: StartPageBody(size: size, s: s),
      ),
    );
  }
}
