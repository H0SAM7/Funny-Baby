
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:funny_baby/core/utils/app_routes.dart';
import 'package:funny_baby/features/auth/presentation/views/login_page.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/helper/auth_firebase.dart';
import 'package:funny_baby/core/widgets/custom_show_dialog.dart';
import 'package:go_router/go_router.dart';

void showConfirmationDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ConfirmationDialog(
          title: S.of(context).delete_my_account,
          content: S.of(context).confirm_dialog_content,
          onConfirm: () async {
            await AuthHelper().deleteUser();
            log('delete done');
            await AuthHelper().logout();
            // Navigator.of(context).pushAndRemoveUntil(
            //   MaterialPageRoute(
            //       builder: (context) =>
            //           const LoginPage()), // Replace with your home screen widget
            //   (Route<dynamic> route) =>
            //       false, // This condition removes all previous routes
            // );
              GoRouter.of(context).clearStackAndNavigate('/${LoginPage.id}');
          });
    },
  );
}