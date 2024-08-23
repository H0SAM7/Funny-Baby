import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle styleRegular16(context) {
    return TextStyle(
      color: const Color(0xFF064060),
      fontSize: getResponsiveSize(context, fontSize: 16),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF4EB7F2),
      fontSize: getResponsiveSize(context, fontSize: 16),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF064061),
      fontSize: getResponsiveSize(context, fontSize: 16),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleMedium20(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: getResponsiveSize(context, fontSize: 20),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF064061),
      fontSize: getResponsiveSize(context, fontSize: 16),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF064061),
      fontSize: getResponsiveSize(context, fontSize: 20),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular12(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFAAAAAA),
      fontSize: getResponsiveSize(context, fontSize: 12),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold24(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF4EB7F2),
      fontSize: getResponsiveSize(context, fontSize: 24),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFAAAAAA),
      fontSize: getResponsiveSize(context, fontSize: 14),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: getResponsiveSize(context, fontSize: 18),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
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
  if (width < 850) {
    return width / 600;
  } else if (width < 1200) {
    return width / 950;
  } else {
    return width / 1600;
  }
}

