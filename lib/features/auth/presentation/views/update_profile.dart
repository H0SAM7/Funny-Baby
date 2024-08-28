import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/core/widgets/custom_button.dart';
import 'package:funny_baby/core/widgets/custom_progress_hud.dart';
import 'package:funny_baby/core/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:funny_baby/core/widgets/custom_widgets.dart';
import 'package:go_router/go_router.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});
  static String id = 'UpdatePage';

  @override
  State<UpdateProfilePage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<UpdateProfilePage> {
  String? oldpassword;
  String? newpassword;
  String? username;
  bool isloading = false;

  GlobalKey<FormState> FromKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.of(context).size.height;
    final s = S.of(context);
    return CustomProgressHUD(
      verify: true,
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: FromKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: x * 0.20),
         

                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                    ],
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
                    }),

                CustomTextField(
                  hide: true,
                  label: s.old_password,
                  hint: s.old_password_hint,
                  passicon: true,
                  icon: Icon(
                    Icons.lock,
                    color: blueColor,
                  ),
                  onchage: (data) {
                    oldpassword = data;
                  },
                ),
                CustomTextField(
                  hide: true,
                  label: s.new_password,
                  hint: s.new_password_hint,
                  passicon: true,
                  icon: Icon(
                    Icons.lock,
                    color: blueColor,
                  ),
                  onchage: (data) {
                    newpassword = data;
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
                  child: CustomButton(
                    color: blueColor,
                    onTap: () async {
                      isloading = true;
                      setState(() {});

                      if (FromKey.currentState!.validate() &&
                          (oldpassword != newpassword!)) {
                        try {
                          await BlocProvider.of<AuthCubit>(context)
                              .updatePasswordAndName(
                                  oldpassword!, newpassword!, username!);
                          showSnackbar(context, 'Updated Done');
                          GoRouter.of(context).pop();
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnackbar(context,
                                'The password is weak, please adding some chars (!@#%)');
                          } else if (e.code == 'wrong-password') {
                            showSnackbar(context,
                                'The old password is incorrect.'); // Notify the user that the old password is incorrect
                          } else {
                            showSnackbar(context, e.message.toString());
                          }
                        } on FirebaseException catch (e) {
                          showSnackbar(context, e.message.toString());
                        } catch (e) {
                          showSnackbar(context, e.toString());
                        }
                      }
                      isloading = false;
                      setState(() {});
                    },
                    buttonName: s.update_account,
                    txtcolor: Colors.white,
                  ),
                ),

                SizedBox(height: x * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}