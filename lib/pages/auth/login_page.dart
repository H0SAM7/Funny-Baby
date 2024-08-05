import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/helper/auth_firebase.dart';
import 'package:funny_baby/helper/helper_functions.dart';
import 'package:funny_baby/pages/auth/register_page.dart';
import 'package:funny_baby/pages/home.dart';
import 'package:funny_baby/widgets/custom_button.dart';
import 'package:funny_baby/widgets/custom_progress.dart';
import 'package:funny_baby/widgets/custom_text_field.dart';
import 'package:funny_baby/widgets/custom_widgets.dart';



class LoginPage extends StatefulWidget {
  static String id = 'LoginPage';
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  bool isloading = false;
  GlobalKey<FormState> FromKey = GlobalKey<FormState>();

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
            key: FromKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: hi * .2,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      !isarabic ? s.funny : s.baby,
                      style: TextStyle(
                          color: blueColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          fontSize: 28),
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
                          fontSize: 28),
                    ),
                  ],
                ),
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
                            color:!isDarkMode? blueColor:Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
                  child: CustomButton(
                    buttonName: s.loginButton,
                    txtcolor: Colors.white,
                    color: Color.fromARGB(255, 38, 70, 83),
                    onTap: () async {
                      isloading = true;

                      setState(() {});
                      if (FromKey.currentState!.validate()) {
                        try {
                          await AuthHelper().LoginUser(email!, password!);
                          Navigator.pushNamed(context, MyHome.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            ShowSnackbar(context, s.user_not_found);
                          } else if (e.code == 'wrong-password') {
                            ShowSnackbar(context, s.wrong_password);
                          } else {
                            ShowSnackbar(context, e.code.toString());
                          }
                        } catch (e) {
                          print(e);
                          ShowSnackbar(context, s.something_went_wrong);
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
                      await AuthHelper().signInWithGoogle();
                      Navigator.pushNamed(context, MyHome.id);
                    },
                  ),
                ),
                      SizedBox(height: hi * 0.01),
                Padding(
                    padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
                    child: CustomButton(
                      buttonName: s.registerButton,
                      txtcolor: isDarkMode?Colors.white:blueColor,
                      border: true,
              
                      onTap: () =>
                          Navigator.pushNamed(context, RegisterPage.id),
                    )),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text('Don\'t have an account?',
                //         style: TextStyle(color: Colors.black)),
                //     TextButton(
                //         onPressed: () {
                //           Navigator.pushNamed(context, RegisterPage.id);
                //         },
                //         child: Text('REGISTER',
                //             style: TextStyle(
                //               color: mainColor,
                //             )))
                //   ],
                // ),
                SizedBox(height: hi * 0.15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
