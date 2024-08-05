import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/helper/helper_functions.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      surfaceTintColor: mainColor,
      shadowColor: mainColor,
      backgroundColor: blueWhiteColor,
      child: ListView(
        // padding: EdgeInsets.only(top: 50),
        children: <Widget>[
          DrawerHeader(
            child: Container(
              decoration: BoxDecoration(
                color: blueWhiteColor,
                  image: DecorationImage(
                      image: AssetImage('assets/Images/flogo.png'),
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      )),
            ),
          ),
          ListTile(
              leading: Icon(
                Icons.facebook,
                color: Colors.blue,
              ),
              title: Text(
                'Facebook',
              ),
              onTap: () async {
                final Uri _uri =
                    Uri.parse('https://www.facebook.com/funnybabysohag');
                await launchUrlMethod(_uri);
              }),
          ListTile(
              leading: Icon(
                FontAwesomeIcons.whatsapp,
                color: Colors.green,
              ),
              title: Text("What's App"),
              onTap: () async {
                final Uri _uri = Uri.parse('https://wa.link/lhdcmy');
                await launchUrlMethod(_uri);
              }),
          ListTile(
              leading: Icon(
                FontAwesomeIcons.telegram,
                color: Colors.blue,
              ),
              title: Text("Telegram"),
              onTap: () {}),
          ListTile(
              leading: Icon(
                FontAwesomeIcons.locationDot,
                color: mainColor,
              ),
              title: Text("Funny Baby"),
              onTap: () async {
                final Uri _uri =
                    Uri.parse('https://www.facebook.com/funnybabysohag');
                await launchUrlMethod(_uri);
              }),
          ListTile(
              leading: Icon(
                FontAwesomeIcons.info,
                color: Colors.green,
              ),
              title: Text("Technical Support"),
              onTap: () {}),
        ],
      ),
    );
  }
}
