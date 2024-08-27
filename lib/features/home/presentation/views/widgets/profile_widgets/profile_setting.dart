import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/core/utils/app_go_routes.dart';
import 'package:funny_baby/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:funny_baby/features/auth/presentation/views/login_view.dart';
import 'package:funny_baby/features/auth/presentation/views/update_profile.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/features/auth/presentation/views/widgets/delete_user_show_dialog.dart';
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
            GoRouter.of(context).push('/${UpdateProfilePage.id}');
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
              DeketeAccountConfirmationDialog(context);
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
              
             await BlocProvider.of<AuthCubit>(context).logout();
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
