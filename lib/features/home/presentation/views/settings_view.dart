import 'package:flutter/material.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/profile_widgets/admin_settings.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/profile_widgets/profile_setting.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/profile_widgets/system_setting.dart';

// ignore: must_be_immutable
class ProfileView extends StatefulWidget {
  static String id = 'ProfilePage';
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final s = S.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            seperatedItem(
              title: s.Admin_Setting,color: !isDarkMode?Colors.black.withOpacity(.4):null
              
            ),
            const AdminSettings(),
            seperatedItem(title: s.profile_setting,color: !isDarkMode?Colors.black.withOpacity(.4):null),
            const ProfileSettings(),
            seperatedItem(title: s.system_setting,color: !isDarkMode?Colors.black.withOpacity(.4):null),
            const SystemSettings(),
          ],
        ),
      ),
    );
  }

  Widget seperatedItem({required String title, Color? color}) {
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
          color: color ?? Colors.white,
        ),
      ),
    );
  }
}
