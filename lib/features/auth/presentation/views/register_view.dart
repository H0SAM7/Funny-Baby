import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/errors/failure.dart';
import 'package:funny_baby/core/helper/helper_functions.dart';
import 'package:funny_baby/core/helper/shared_pref.dart';
import 'package:funny_baby/core/widgets/custom_title.dart';
import 'package:funny_baby/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/core/widgets/custom_button.dart';
import 'package:funny_baby/core/widgets/custom_progress_hud.dart';
import 'package:funny_baby/core/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:funny_baby/core/widgets/custom_widgets.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  String? username;

  bool isloading = false;

  GlobalKey<FormState> fromKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    bool isarabic = isArabic(context);
    var size = MediaQuery.of(context).size;
    return CustomProgressHUD(
      verify: true,
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(title: CustomTitle(isarabic: isarabic, s: s)),
        body: SingleChildScrollView(
          child: Form(
            key: fromKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.2),
                Padding(
                  padding: EdgeInsets.only(
                    left: isarabic ? size.width * .5 : 0,
                    right: !isarabic ? size.width * .4 : 0,
                  ),
                  child: Text(
                    S.of(context).Create_New_Account,
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: blueColor),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [],
                  ),
                ),
                CustomTextField(
                  label: s.Username,
                  hint: s.usernameHint,
                  icon: Icon(
                    FontAwesomeIcons.user,
                    color: blueColor,
                  ),
                  onchage: (data) {
                    username = data;
                  },
                ),
                CustomTextField(
                  label: s.emailLabel,
                  hint: s.emailHint,
                  icon: Icon(
                    Icons.email,
                    color: blueColor,
                  ),
                  onchage: (data) {
                    email = data;
                  },
                ),
                CustomTextField(
                  hide: true,
                  label: s.passwordLabel,
                  hint: s.passwordHint,
                  passicon: true,
                  icon: Icon(Icons.lock, color: blueColor),
                  onchage: (data) {
                    password = data;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
                  child: CustomButton(
                    color: blueColor,
                    onTap: () async {
                      isloading = true;
                      setState(() {});
                      if (fromKey.currentState!.validate()) {
                        try {
                          await BlocProvider.of<AuthCubit>(context)
                              .registerUser(email!, password!, username!);
                          await  SharedPreference().setBool("isLoggedIn", true);
                                  GoRouter.of(context).push('/${MyHome.id}');
                          //isloading = true;
                          //     Navigator.pushNamed(context, MyHome.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnackbar(context, s.weak_password);
                          } else if (e.code == 'invalid-email') {
                            log('The email address is not valid.');
                            showSnackbar(context, s.invalid_email);
                          } else if (e.code == 'email-already-in-use' ||
                              e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
                            showSnackbar(context, s.email_already_in_use);
                          } else {
                            showSnackbar(context, e.message.toString());
                          }
                        } on FirebaseException catch (e) {
                          showSnackbar(
                              context,
                              FirebaseFailure.fromFirebaseException(e)
                                  .toString());
                        } catch (e) {
                          showSnackbar(context, e.toString());
                        }
                      }
                      isloading = false;
                      setState(() {});
                    },
                    buttonName: s.registerButton,
                    txtcolor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
                  child: CustomButton(
                    border: true,
                    image:
                        'http://pngimg.com/uploads/google/google_PNG19635.png',
                    buttonName: s.registerWithGoogleButton,
                    txtcolor: blueColor,
                    color: Colors.white,
                    onTap: () async {
                      
                      await BlocProvider.of<AuthCubit>(context)
                          .signInWithGoogle();
                      //      Navigator.pushNamed(context, MyHome.id);
                    await  SharedPreference().setBool("isLoggedIn", true);
                      GoRouter.of(context).push('/${MyHome.id}');
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(s.alreadyHaveAccount,
                        style: TextStyle(
                          color: blueColor,
                          fontFamily: 'Inter',
                        )),
                    TextButton(
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                        child: Text(s.loginButton,
                            style: TextStyle(
                                color: blueColor,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold)))
                  ],
                ),
                SizedBox(height: size.height * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({super.key});
  static String id = 'UserName';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Placeholder());
  }
}
