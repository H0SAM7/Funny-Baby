import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:funny_baby/core/utils/app_go_routes.dart';
import 'package:funny_baby/features/auth/presentation/views/login_page.dart';
import 'package:funny_baby/features/auth/presentation/views/update_profile.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/helper/auth_firebase.dart';
import 'package:funny_baby/core/widgets/delete_show_dialog.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/profile_widgets/item_setting.dart';
import 'package:go_router/go_router.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      children: [
        ItemSetting(
          title: s.update_account,
          prefixIcon: Icons.account_box,
          onTap: () {
            //  Navigator.pushNamed(context, UpdateProfilePage.id);
          GoRouter.of(context).push('/${UpdateProfilePage.id }');
          
          },
          suffixIcon: Container(),
        ),
        const Divider(
          indent: 20,
          endIndent: 20,
          thickness: .3,
        ),
        //  const SizedBox(height: 10),
        ItemSetting(
            title: s.delete_my_account,
            prefixIcon: Icons.delete,
            onTap: () {
              showConfirmationDialog(context);
              //  log('deleted done');
            },
            suffixIcon: Container()),
        const Divider(
          indent: 20,
          endIndent: 20,
          thickness: .3,
        ),
        // const SizedBox(height: 15),
        ItemSetting(
            title: s.log_out,
            prefixIcon: Icons.logout,
            onTap: () async {
              await AuthHelper().logout();
              log('logout done');
              // Navigator.of(context).pushAndRemoveUntil(
              //   MaterialPageRoute(builder: (context) => const LoginPage()),
              //   (Route<dynamic> route) => false,
              // );
              GoRouter.of(context).clearStackAndNavigate('/${LoginPage.id}');
            },
            suffixIcon: Container()),
      ],
    );
  }
}
