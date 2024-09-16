import 'package:flutter/material.dart';
import 'package:funny_baby/features/cart/presentation/views/cart_view.dart';
import 'package:funny_baby/features/home/presentation/views/categories_view.dart';
import 'package:funny_baby/features/home/presentation/views/home_view.dart';
import 'package:funny_baby/features/home/presentation/views/discounts_view.dart';
import 'package:funny_baby/features/home/presentation/views/profile_view.dart';

List<Color> background = [
  const Color(0xFFCAF0F8), // rgb(246, 245, 242)
  const Color.fromRGBO(240, 235, 227, 1.0), // rgb(240, 235, 227)
  const Color.fromARGB(255, 247, 109, 233)
  // Color.fromRGBO(243, 208, 215, 1.0), // rgb(243, 208, 215)
  // Color.fromRGBO(255, 239, 239, 1.0), // rgb(255, 239, 239)
];

Color mainColor = const Color.fromARGB(255, 222, 74, 123);
Color funnyBlueColor = const Color(0xff81b4c2);
Color funnyPinkColor= const Color.fromARGB(255, 229, 127, 125);

Color moveColor = const Color.fromARGB(255, 247, 109, 233);
Color blueColor = const Color.fromARGB(255, 38, 70, 83);
Color blueWhiteColor = const Color(0xFFCAF0F8);

// Color mainColor=Color.fromARGB(255, 244, 204, 212);

List<String> categoriesAR = const [
  "اولادي",
  "بناتي",
  "حديثي الولادة",
  "ملابس داخلية",
  "بيجامة",
  "اكسسوارات",
  "مصيف",
  "احذية",
  "سواريه",
];

final List<Widget> widgetOptions = <Widget>[
  const HomePage(),
  const CartView(),
  const DiscountsView(),
  const CategoriesView(),
  ProfileView(),
];
