import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/errors/translate_failures.dart';
import 'package:funny_baby/core/helper/helper_functions.dart';
import 'package:funny_baby/core/utils/assets.dart';
import 'package:funny_baby/core/widgets/custom_title.dart';
import 'package:funny_baby/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:funny_baby/features/auth/presentation/views/login_view.dart';
import 'package:funny_baby/bottom_navigation_bar.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/core/widgets/custom_button.dart';
import 'package:funny_baby/core/widgets/custom_progress_hud.dart';
import 'package:funny_baby/core/widgets/custom_text_field.dart';
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
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showErrorSnackbar(context, state.errMessage);
        } else if (state is AuthSuccess) {
          GoRouter.of(context).push('/${BottomNavi.id}');
        }
      },
      builder: (context, state) {
        bool isLoading = state is AuthLoading;

        return CustomProgressHUD(
          verify: true,
          inAsyncCall: isLoading,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: fromKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //SizedBox(height: size.height * 0.2),
                    Container(
                      height: size.height * .35,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(Assets.imagesFunnyLogo),
                      )),
                    ),
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
                            color: funnyBlueColor),
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
                        color: funnyBlueColor,
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
                        color: funnyBlueColor,
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
                      icon: Icon(Icons.lock, color: funnyBlueColor),
                      onchage: (data) {
                        password = data;
                      },
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 8, left: 8),
                      child: CustomButton(
                        color: funnyPinkColor,
                        onTap: () async {
                          if (fromKey.currentState!.validate()) {
                            await BlocProvider.of<AuthCubit>(context)
                                .registerUser(email!, password!, username!);

                            // await SharedPreference()
                            //     .setBool("isLoggedIn", true);
                          }
                        },
                        buttonName: s.registerButton,
                        txtcolor: Colors.white,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 8, left: 8),
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
                        //  await SharedPreference().setBool("isLoggedIn", true);
                          //GoRouter.of(context).push('/${MyHome.id}');
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
          GoRouter.of(context).push('/${LoginPage.id}');
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
      },
    );
  }
}
