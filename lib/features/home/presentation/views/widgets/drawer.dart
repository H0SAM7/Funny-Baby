import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/helper/helper_functions.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color backgroundColor = isDarkMode ? Colors.black : blueWhiteColor;
    Color textColor = isDarkMode ? Colors.white : Colors.black;

    return Drawer(
      surfaceTintColor: mainColor,
      shadowColor: mainColor,
      backgroundColor: backgroundColor,
      child: DrawerListView(textColor: textColor),
    );
  }
}

class DrawerListView extends StatelessWidget {
  const DrawerListView({
    super.key,
    required this.textColor,
  });

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(height: 60,),
        ListTile(
          textColor: textColor,
          leading: const Icon(
            Icons.facebook,
            color: Colors.blue,
          ),
          title: Text(
            'Facebook',
            style: TextStyle(color: textColor),
          ),
          onTap: () async {
            final Uri uri0 = Uri.parse('https://www.facebook.com/funnybabysohag');
            await launchUrlMethod(uri0);
          }
        ),
        ListTile(
          textColor: textColor,
          leading: const Icon(
            FontAwesomeIcons.whatsapp,
            color: Colors.green,
          ),
          title: Text(
            "What's App",
            style: TextStyle(color: textColor),
          ),
          onTap: () async {
            final Uri uri1 = Uri.parse('https://wa.link/lhdcmy');
            await launchUrlMethod(uri1);
          }
        ),
        ListTile(
          textColor: textColor,
          leading: const Icon(
            FontAwesomeIcons.telegram,
            color: Colors.blue,
          ),
          title: Text(
            "Telegram",
            style: TextStyle(color: textColor),
          ),
          onTap: () {}
        ),
        ListTile(
          textColor: textColor,
          leading: Icon(
            FontAwesomeIcons.locationDot,
            color: mainColor,
          ),
          title: Text(
            "Funny Baby",
            style: TextStyle(color: textColor),
          ),
          onTap: () async {
            final Uri uri = Uri.parse('https://www.facebook.com/funnybabysohag');
            await launchUrlMethod(uri);
          }
        ),
        ListTile(
          textColor: textColor,
          leading: const Icon(
            FontAwesomeIcons.info,
            color: Colors.green,
          ),
          title: Text(
            "Technical Support",
            style: TextStyle(color: textColor),
          ),
          onTap: () {}
        ),
      ],
    );
  }
}
