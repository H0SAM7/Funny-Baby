import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

bool isArabic(BuildContext context) {
  return Localizations.localeOf(context).languageCode == 'ar';
}
  Future<void> launchUrlMethod(Uri uri) async {
    //const url = 'https://www.facebook.com/funnybabysohag';

    if (!await canLaunchUrl(uri)) {
      final bool launched =
          await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        print('Could not launch $uri');
      }
    } else {
      print('Cannot launch URL: $uri');
    }
  }
