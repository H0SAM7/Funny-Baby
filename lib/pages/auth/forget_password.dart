import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/helper/helper_functions.dart';
import 'package:funny_baby/widgets/custom_button.dart';
import 'package:funny_baby/widgets/custom_text_field.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  static String id = 'ForgetPassword';

  @override
  Widget build(BuildContext context) {
    bool isarabic = isArabic(context);
    var size = MediaQuery.of(context).size;
    final s = S.of(context);
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: isarabic ? size.width * .5 : 0,
                    right: !isarabic ? size.width * .5 : 0,
                    bottom: size.height * .05),
                child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      s.reset_password,
                      style: TextStyle(
                          color: blueColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              CustomTextField(label: s.emailLabel, hint: s.emailHint),
              SizedBox(
                height: size.height*.2,
              ),
              CustomButton(
                buttonName: s.send,
                color: blueColor,
                txtcolor: Colors.white,
                onTap: (){
                  
                },
          
              )
            ],
          ),
        ));
  }
}
