import 'package:flutter/material.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/widgets/admin_settings.dart';
import 'package:funny_baby/widgets/profile_setting.dart';
import 'package:funny_baby/widgets/system_setting.dart';

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
            SeperatedItem(title: s.Admin_Setting),
            const AdminSettings(),
            SeperatedItem(title: s.profile_setting),
            const ProfileSettings(),
            SeperatedItem(title: s.system_setting),
            const SystemSettings(),
          ],
        ),
      ),
    );
  }

  // void _changeLanguage(BuildContext context, Locale locale) {
  //   FunnyBaby.setLocale(context, locale);
  // }


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
