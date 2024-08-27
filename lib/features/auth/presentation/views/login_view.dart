import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/helper/shared_pref.dart';
import 'package:funny_baby/core/widgets/custom_title.dart';
import 'package:funny_baby/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:funny_baby/features/auth/presentation/views/register_view.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/core/helper/helper_functions.dart';
import 'package:funny_baby/core/widgets/custom_button.dart';
import 'package:funny_baby/core/widgets/custom_progress_hud.dart';
import 'package:funny_baby/core/widgets/custom_text_field.dart';
import 'package:funny_baby/core/widgets/custom_widgets.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  static String id = 'LoginPage';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  bool isloading = false;
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isarabic = isArabic(context);
    var hi = MediaQuery.of(context).size.height;
    var wi = MediaQuery.of(context).size.width;
    final s = S.of(context);
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return CustomProgressHUD(
      // progressIndicator: CustomLoadingIndicator(),
      inAsyncCall: isloading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: fromKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: hi * .2,
                ),
                CustomTitle(isarabic: isarabic, s: s),
                SizedBox(height: hi * 0.1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    icon: Icon(
                      Icons.email,
                      color: blueColor,
                    ),
                    label: s.emailLabel,
                    hint: s.emailHint,
                    onchage: (data) {
                      email = data;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    icon: Icon(
                      Icons.lock,
                      color: blueColor,
                    ),
                    hide: true,
                    passicon: true,
                    label: s.passwordLabel,
                    hint: s.passwordHint,
                    onchage: (data) {
                      password = data;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    //  left: !isarabic ? wi * .4 : 0,
                    right: wi * .5,
                  ),
                  child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        s.forget_password,
                        style: TextStyle(
                            color: !isDarkMode ? blueColor : Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
                  child: CustomButton(
                    buttonName: s.loginButton,
                    txtcolor: Colors.white,
                    color: const Color.fromARGB(255, 38, 70, 83),
                    onTap: () async {
                      isloading = true;

                      setState(() {});
                      if (fromKey.currentState!.validate()) {
                        try {
                          BlocProvider.of<AuthCubit>(context)
                              .loginUser(email!, password!);

                          await SharedPreference().setBool("isLoggedIn", true);
                          GoRouter.of(context).push('/${MyHome.id}');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackbar(context, s.user_not_found);
                          } else if (e.code == 'wrong-password') {
                            showSnackbar(context, s.wrong_password);
                          } else {
                            showSnackbar(context, e.code.toString());
                          }
                        } catch (e) {
                          log(e.toString());
                          showSnackbar(context, s.something_went_wrong);
                        }
                      }
                      isloading = false;
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(height: hi * 0.01),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
                  child: CustomButton(
                    border: true,
                    image:
                        'http://pngimg.com/uploads/google/google_PNG19635.png',
                    buttonName: s.Login_with_google,
                    txtcolor: blueColor,
                    color: Colors.white,
                    onTap: () async {
                      isloading = true;

                      setState(() {});
                      await BlocProvider.of<AuthCubit>(context)
                          .signInWithGoogle();
                      await SharedPreference().setBool("isLoggedIn", true);
                      GoRouter.of(context).push('/${MyHome.id}');
                      isloading = false;

                      setState(() {});
                    },
                  ),
                ),
                SizedBox(height: hi * 0.01),
                Padding(
                    padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
                    child: CustomButton(
                      buttonName: s.registerButton,
                      txtcolor: isDarkMode ? Colors.white : blueColor,
                      border: true,
                      onTap: () =>
                          //     Navigator.pushNamed(context, RegisterPage.id),
                          GoRouter.of(context).push('/${RegisterPage.id}'),
                    )),
                SizedBox(height: hi * 0.15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
