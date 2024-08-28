import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/widgets/custom_button.dart';
import 'package:funny_baby/core/widgets/custom_show_dialog2.dart';
import 'package:funny_baby/core/widgets/custom_text_field.dart';
import 'package:funny_baby/core/widgets/custom_widgets.dart';
import 'package:funny_baby/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  static String id = 'ForgetPassword';

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  icon: Icon(
                    Icons.email,
                    color: blueColor,
                  ),
                  label: s.emailLabel,
                  hint: s.emailHint,
                  controller: emailController,
                  onchage: (data) {
                    emailController.text = data;
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  buttonName: s.send,
                  color: blueColor,
                  txtcolor: Colors.white,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      // Handle form submission logic
                      try {
                        await BlocProvider.of<AuthCubit>(context)
                            .forgotPassword(email: emailController.text);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ConfirmationDialog2(
                                  title: '',
                                  content:
                                      'الرجاء الذهاب الي البريد الوارد وكتابة كلمة المرور الجديدة',
                                  onConfirm: () {},
                                  action: '');
                            });
                        GoRouter.of(context).push('/${MyHome.id}');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackbar(context, s.user_not_found);
                        } else {
                          showSnackbar(context, e.code.toString());
                        }
                      } catch (e) {
                        log(e.toString());
                        showSnackbar(context, s.user_not_found);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
