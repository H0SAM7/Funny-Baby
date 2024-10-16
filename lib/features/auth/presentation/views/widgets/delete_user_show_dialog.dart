import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/core/errors/translate_failures.dart';
import 'package:funny_baby/core/utils/app_go_routes.dart';
import 'package:funny_baby/core/widgets/custom_loading_indecator.dart';
import 'package:funny_baby/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:funny_baby/features/auth/presentation/views/login_view.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/core/widgets/custom_show_dialog.dart';
import 'package:go_router/go_router.dart';

void deketeAccountConfirmationDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          GoRouter.of(context).clearStackAndNavigate('/${LoginPage.id}');
        }
        else if(state is AuthFailure){
          showErrorSnackbar(context, state.errMessage);

        }
        else{
           const CustomLoadingIndicator();
        }
      },
        child: ConfirmationDialog(
            title: S.of(context).delete_my_account,
            content: S.of(context).confirm_dialog_content,
            onConfirm: () async {
              await BlocProvider.of<AuthCubit>(context).deleteUser();
              log('delete done');
              await BlocProvider.of<AuthCubit>(context).logout();

              // Navigator.of(context).pushAndRemoveUntil(
              //   MaterialPageRoute(
              //       builder: (context) =>
              //           const LoginPage()), // Replace with your home screen widget
              //   (Route<dynamic> route) =>
              //       false, // This condition removes all previous routes
              // );
            //  GoRouter.of(context).clearStackAndNavigate('/${LoginPage.id}');
            }),
      );
    },
  );
}
