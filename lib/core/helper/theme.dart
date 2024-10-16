import 'package:flutter/material.dart';

class MyAppThemes {
  static final lightTheme = ThemeData(
    primaryColor: MyAppColors.lightBlue,
    brightness: Brightness.light,
    
  );

  static final darkTheme = ThemeData(
    primaryColor: MyAppColors.darkBlue,
    brightness: Brightness.dark,
    
  );
}
class MyAppColors {
  static const darkBlue = Color(0xFF1E1E2C);
  static const lightBlue = Color(0xFF2D2D44);
}