import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/pages/category_page.dart';

// ignore: must_be_immutable
class CustomCategory extends StatelessWidget {
  CustomCategory({super.key, required this.name});
  String name;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, categoryPage.id, arguments: name);
      },
      child: ClipRRect(
         borderRadius: BorderRadius.circular(25),
        child: Container(
         // height: size.height*.5,
         // width: size.width*.2,
 
          child: Center(
              child: Text(
            '',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          )),
          decoration: BoxDecoration(
             // borderRadius: BorderRadius.circular(30),
              color: mainColor,
              image: DecorationImage(
                  image: AssetImage("assets/Images/$name.jpg"),
                  fit: BoxFit.fill)
                  ),
        ),
      ),
    );
  }
}
