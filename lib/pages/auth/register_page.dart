import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/helper/auth_firebase.dart';
import 'package:funny_baby/helper/helper_functions.dart';

import 'package:funny_baby/pages/home.dart';

import 'package:funny_baby/widgets/custom_button.dart';
import 'package:funny_baby/widgets/custom_progress.dart';
import 'package:funny_baby/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:funny_baby/widgets/custom_widgets.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;
  String? password;
  String? username;
  bool isloading = false;

  GlobalKey<FormState> FromKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    bool isarabic = isArabic(context);
    var hi = MediaQuery.of(context).size.height;
    var wi = MediaQuery.of(context).size.width;
    return CustomProgressHUD(
      verify: true,
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                !isarabic ? s.funny : s.baby,
                style: TextStyle(
                    color: blueColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    fontSize: 20),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                isarabic ? s.funny : s.baby,
                style: TextStyle(
                    color: const Color.fromARGB(255, 247, 109, 233),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    fontSize: 20),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: FromKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: hi * 0.2),
                //     CircleAvatar(
                //   radius: 85, // Adjust the radius as needed
                //   backgroundImage: AssetImage('assets/images/chat.png'),
                // ),
                Padding(
                  padding: EdgeInsets.only(
                    left: isarabic ? wi * .5 : 0,
                    right: !isarabic ? wi * .4 : 0,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Text('Log In: ',style: TextStyle(color: Colors.white,fontSize: 26),),
                    ],
                  ),
                ),
                // CustomTextField(
                //   hint: 'enter your name',
                //   label: 'Username',

                // ),
                CustomTextField(
                    label: s.Username,
                    hint: s.usernameHint,
                    icon: Icon(
                      FontAwesomeIcons.user,
                      color: blueColor,
                    ),
                    onchage: (data) {
                      username = data;
                    }),
                CustomTextField(
                    label: s.emailLabel,
                    hint: s.emailHint,
                    icon: Icon(
                      Icons.email,
                      color: blueColor,
                    ),
                    onchage: (data) {
                      email = data;
                    }),
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
                      setState(() {
                       
                      });

                      if (FromKey.currentState!.validate()) {
                         ShowSnackbar(context, s.check_inbox);
                        try {
                          await AuthHelper()
                              .RegisterUser(email!, password!, username!);
                              
                          Navigator.pushNamed(context, MyHome.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            ShowSnackbar(context, s.weak_password);
                          } else if (e.code == 'invalid-email') {
                            log('The email address is not valid.');
                            ShowSnackbar(context, s.invalid_email);
                          } else if (e.code == 'email-already-in-use' ||
                              e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
                            ShowSnackbar(context, s.email_already_in_use);
                          } else {
                            ShowSnackbar(context, e.message.toString());
                          }
                        } on FirebaseException catch (e) {
                          ShowSnackbar(context, e.message.toString());
                        } catch (e) {
                          ShowSnackbar(context, e.toString());
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
                      await AuthHelper().signInWithGoogle();
                      Navigator.pushNamed(context, MyHome.id);
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
                          Navigator.pop(context);
                        },
                        child: Text(s.loginButton,
                            style: TextStyle(
                                color: blueColor,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.bold)))
                  ],
                ),

                SizedBox(height: hi * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
