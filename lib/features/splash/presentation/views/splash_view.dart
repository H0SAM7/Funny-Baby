import 'package:flutter/material.dart';
import 'package:funny_baby/core/helper/shared_pref.dart';
import 'package:funny_baby/core/widgets/custom_show_dialog2.dart';
import 'package:funny_baby/features/auth/presentation/views/login_view.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:funny_baby/features/splash/presentation/views/widgets/read_crash_value.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:funny_baby/widgets/crash_view.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static String id = 'SplashView';

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () async {
          bool isCrashed = await readCrash();
            bool relogin = await readRelogin();
          if (isCrashed) {
            showDialog(

              context: context,
              builder: (BuildContext context) {
                return ConfirmationDialog2(
                  title: '',
                  content:
                      'يتم اجراء بعض اعمال الصيانة الرجاء المحاولة لاحقا سيتم اعادة تشغيل الخدمة في اقرب وقت',
                  onConfirm: () {
                    GoRouter.of(context).push('/${CrashView.id}');
                  },
                  action: 'موافق',
                );
              },
            );
          } else {
            bool isLoggedIn =
                await SharedPreference().getBool("isLoggedIn") ?? false;
            if (isLoggedIn &&!relogin ) {
              
              GoRouter.of(context).push('/${MyHome.id}');
            } else {
          
              GoRouter.of(context).push('/${LoginPage.id}');
            }
          }
        },
        child: SplashviewBody(size: size, s: s),
      ),
    );
  }
}
