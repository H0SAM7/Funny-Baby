
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:funny_baby/cubit/cahnge_mode.dart';
import 'package:funny_baby/cubit/lang_cubit.dart';

import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/helper/auth_firebase.dart';

import 'package:funny_baby/pages/Admin/add_products.dart';
import 'package:funny_baby/pages/Admin/add_sales.dart';
import 'package:funny_baby/pages/Admin/delete_product.dart';
import 'package:funny_baby/pages/auth/login_page.dart';
import 'package:funny_baby/pages/auth/update_profile.dart';


// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});
  bool isDark = false;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(

            //     width: double.infinity,
            //    // color: Colors.blueGrey,
            //     height: 225,
            //     child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           CircleAvatar(
            //             maxRadius: 50,
            //            // backgroundImage: NetworkImage(userImage.toString()),
            //             foregroundColor: Colors.grey,
            //           ),

            //           Text(
            //  '',
            //             style: const TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 16,
            //                 color: Colors.grey),
            //           ),

            //           DefaultButton(
            //             color: mainColor,
            //             splashColor: mainColor,
            //               title: Row(
            //                 mainAxisSize: MainAxisSize.min,
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: const [
            //                   Text("Upload Image",style: TextStyle(color: Colors.white),),
            //                   SizedBox(
            //                     width: 10,
            //                   ),
            //                   Icon(Icons.arrow_forward_ios, size: 18)
            //                 ],
            //               ),
            //               onTap: () async{

            //               },
            //               shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(25))),
            //         ])),




            SeperatedItem(title: s.Admin_Setting),
            ItemComponent(
                onTap: () {
                  Navigator.pushNamed(context, AddProductsPage.iD);
                },
                title: s.add_product,
                prefixIcon: Icons.add,
                suffixIcon: Container()),
            const Divider(
              indent: 20,
              endIndent: 20,
              thickness: .3,
            ),
            ItemComponent(
                onTap: () {},
                title: s.update_products,
                prefixIcon: Icons.update,
                suffixIcon: Container()),
            const Divider(
              indent: 20,
              endIndent: 20,
              thickness: .3,
            ),
            ItemComponent(
                onTap: () {
                  Navigator.pushNamed(context, AddSales.id);
                },
                title: s.add_sale,
                prefixIcon: Icons.add,
                suffixIcon: Container()),
            const Divider(
              indent: 20,
              endIndent: 20,
              thickness: .3,
            ),
            ItemComponent(
                onTap: () {
                  Navigator.pushNamed(context, DeleteProductsPage.id);
                },
                title: s.delete_products,
                prefixIcon: Icons.delete_forever,
                suffixIcon: Container()),

            SeperatedItem(title: s.profile_setting),
            ItemComponent(
              title: s.update_account,
              prefixIcon: Icons.account_box,
              onTap: () {
                Navigator.pushNamed(context, UpdateProfilePage.id);
              },
              suffixIcon: Container(),
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              thickness: .3,
            ),
            //  const SizedBox(height: 10),
            ItemComponent(
                title: s.delete_my_account,
                prefixIcon: Icons.delete,
                onTap: () {
                  showConfirmationDialog(context);
                  //  log('deleted done');
                },
                suffixIcon: Container()),
            const Divider(
              indent: 20,
              endIndent: 20,
              thickness: .3,
            ),
            // const SizedBox(height: 15),
            ItemComponent(
                title: s.log_out,
                prefixIcon: Icons.logout,
                onTap: () async {
                  await AuthHelper().logout();
                  log('logout done');
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginPage()), // Replace with your home screen widget
                    (Route<dynamic> route) =>
                        false, // This condition removes all previous routes
                  );
                },
                suffixIcon: Container()),

            SeperatedItem(title: s.system_setting),
           ItemComponent(
            title: s.language,
            prefixIcon: Icons.language,
            onTap: () {
              log(isArabic(context).toString());
              context.read<LanguageCubit>().setLocale(
                isArabic(context) ? const Locale('en', '') : const Locale('ar', ''),
              );
            },
            suffixIcon: Row(
              children: [
                Text(
                  isArabic(context) ? 'English' : 'العربية', // Change text based on current locale
                  style: TextStyle(color:widget.isDark
                        ? Colors.white.withOpacity(0.5)
                        : Colors.black.withOpacity(0.5)),
                ),
                const SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 19,
                  color: widget.isDark
                        ? Colors.white.withOpacity(0.5)
                        : Colors.black.withOpacity(0.5),
                ),
              ],
            ),
          ),
            const SizedBox(height: 10),
            ItemComponent(
              title: s.dark_mode,
              prefixIcon: Icons.mode_night_outlined,
              onTap: () {},
              suffixIcon: Switch(
                  value: widget.isDark,
                  onChanged: (val) {
                    setState(() {
                      widget.isDark = val;
                    });
                      context.read<ThemeCubit>().toggleTheme();
                    // FunnyBaby.of(context).changeTheme(
                    //     !widget.isDark ? ThemeMode.light : ThemeMode.dark);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  // void _changeLanguage(BuildContext context, Locale locale) {
  //   FunnyBaby.setLocale(context, locale);
  // }
 bool isArabic(BuildContext context) {
  return Localizations.localeOf(context).languageCode == 'ar';
}

  Widget ItemComponent(
      {required String title,
      required IconData prefixIcon,
      required dynamic onTap,
      required dynamic suffixIcon}) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Icon(
                prefixIcon,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: TextStyle(
               fontFamily: 'Inter',
                   fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: widget.isDark
                        ? Colors.white.withOpacity(0.5)
                        : Colors.black.withOpacity(0.5)),
              ),
              const Spacer(),
              suffixIcon,
            ],
          ),
        ));
  }

  Widget DefaultButton(
      {required Widget title,
      required dynamic onTap,
      required Color splashColor,
      double? width,
      double? height,
      dynamic shape,
      required Color color}) {
    return MaterialButton(
      onPressed: onTap,
      splashColor: splashColor,
      minWidth: width,
      height: height,
      shape: shape,
      color: color,
      elevation: 0,
      child: title,
    );
  }

  Widget SeperatedItem({required String title}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      color: Colors.grey.withOpacity(0.15),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: widget.isDark
                ? Colors.white.withOpacity(0.4)
                : Colors.black.withOpacity(0.4)),
      ),
    );
  }
}

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;

  const ConfirmationDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          child: Text(S.of(context).cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(S.of(context).confirm),
          onPressed: () {
            onConfirm();
          },
        ),
      ],
    );
  }
}

// Usage
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
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) =>
                      LoginPage()), // Replace with your home screen widget
              (Route<dynamic> route) =>
                  false, // This condition removes all previous routes
            );
          });
    },
  );
}

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
