import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {

  
  static TextStyle styleMedium18(BuildContext context) {
    return TextStyle(
      color: blueColor,
      fontSize: getResponsiveSize(context, fontSize: 18),
   fontFamily: GoogleFonts.amiri().fontFamily,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle styleRegular16(context) {
    return TextStyle(
      color: blueColor,
      fontSize: getResponsiveSize(context, fontSize: 16),
      fontFamily:  GoogleFonts.amiri().fontFamily,
      fontWeight: FontWeight.bold,
    );
  }

  
}

// sacleFactor
// responsive font size
// (min , max) fontsize

double getResponsiveSize(BuildContext context, {required double fontSize}) {

  double responsiveSize = fontSize * getScaleFactor(context);
  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  responsiveSize.clamp(lowerLimit, upperLimit);
  //log(responsiveSize.toString());
  return responsiveSize;
}

double getScaleFactor(BuildContext context) {
  //   var disPacher=PlatformDispatcher.instance;
  // var physicalWidth=disPacher.views.first.physicalSize.width;
  // var devicePixelRatio=disPacher.views.first.devicePixelRatio;  
  // double width=physicalWidth/devicePixelRatio;   ------> contextبديل الميديا كويري في حال انك مش عايز تستخدم ال 

  double width = MediaQuery.sizeOf(context).width;
  if (width < 750) {
    return width / 450;
  } else if (width < 1200) {
    return width / 800;
  } else {
    return width / 1600;
  }
}

