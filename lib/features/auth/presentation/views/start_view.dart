import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/utils/assets.dart';
import 'package:funny_baby/core/widgets/custom_button.dart';
import 'package:funny_baby/features/auth/presentation/views/login_view.dart';
import 'package:funny_baby/features/auth/presentation/views/register_view.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});
  static String id = 'StartView';
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesLogin),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 400,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
            child: CustomButton(
              buttonName: s.loginButton,
              txtcolor: Colors.white,
              color: funnyPinkColor,
              onTap: () {
                GoRouter.of(context).push('/${LoginPage.id}');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
            child: CustomButton(
              buttonName: s.registerButton,
              txtcolor: funnyPinkColor,
              color: Colors.white,
              onTap: () {
                GoRouter.of(context).push('/${RegisterPage.id}');
              },
            ),
          ),
        ],
      ),
    ));
  }
}
