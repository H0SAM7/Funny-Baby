import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/errors/translate_failures.dart';
import 'package:funny_baby/core/utils/assets.dart';

import 'package:funny_baby/core/widgets/custom_title.dart';
import 'package:funny_baby/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:funny_baby/features/auth/presentation/views/forget_password_view.dart';
import 'package:funny_baby/features/auth/presentation/views/register_view.dart';
import 'package:funny_baby/bottom_navigation_bar.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/core/helper/helper_functions.dart';
import 'package:funny_baby/core/widgets/custom_button.dart';
import 'package:funny_baby/core/widgets/custom_progress_hud.dart';
import 'package:funny_baby/core/widgets/custom_text_field.dart';
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
          inAsyncCall: isLoading,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: fromKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: hi * .1,
                    ),
                    // CustomTitle(isarabic: isarabic, s: s),
                    Container(
                      height: hi * .35,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(Assets.imagesFunnyLogo),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        icon: Icon(
                          Icons.email,
                          color: funnyBlueColor,
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
                          color: funnyBlueColor,
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
                          onTap: () {
                            GoRouter.of(context).push('/${ForgetPassword.id}');
                          },
                          child: Text(
                            s.forget_password,
                            style: TextStyle(
                                color: !isDarkMode ? funnyBlueColor : Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 8, left: 8),
                      child: CustomButton(
                        buttonName: s.loginButton,
                        txtcolor: Colors.white,
                        color: funnyPinkColor,
                        onTap: () async {
                          if (fromKey.currentState!.validate()) {
                            await BlocProvider.of<AuthCubit>(context)
                                .loginUser(email!, password!);

                            // await SharedPreference()
                            //     .setBool("isLoggedIn", true);
                          }
                        },
                      ),
                    ),
                    SizedBox(height: hi * 0.01),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 8, left: 8),
                      child: CustomButton(
                        border: true,
                        image:
                            'http://pngimg.com/uploads/google/google_PNG19635.png',
                        buttonName: s.Login_with_google,
                        txtcolor: Colors.white,
                        color: funnyBlueColor,
                        onTap: () async {
                          await BlocProvider.of<AuthCubit>(context)
                              .signInWithGoogle();
                          //  await SharedPreference().setBool("isLoggedIn", true);
                        },
                      ),
                    ),
                    SizedBox(height: hi * 0.01),
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 8, left: 8),
                        child: CustomButton(
                          buttonName: s.registerButton,
                          txtcolor: isDarkMode ? Colors.white : funnyPinkColor,
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
      },
    );
  }
}
