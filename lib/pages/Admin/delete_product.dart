import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/services/fire_base.dart';
import 'package:funny_baby/widgets/custom_button.dart';
import 'package:funny_baby/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class DeleteProductsPage extends StatelessWidget {
  DeleteProductsPage({super.key});
  static String id = 'DeleteProductsPage';

  final TextEditingController idController = TextEditingController();

  String? image;
  GlobalKey<FormState> FromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(s.delete_products)),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: blueColor,
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: SingleChildScrollView(
          child: Form(
            key: FromKey,
            child: Column(
              children: [
                CustomTextField(
                  label: s.product_code,
                  hint: s.enter_product_code,
                  controller: idController,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  buttonName: s.send,
                  border: true,
                  txtcolor: Colors.white,
                  color: blueColor,
                  onTap: () async {
                    if (FromKey.currentState!.validate()) {
                      await FireBaseServices()
                          .deleteProduct(idController.text.toString());
                      log('Delete product Done');

                      ShowSnackbar(context, s.deleteSuccess);
                      idController.clear();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void ShowSnackbar(BuildContext context, String massage) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(massage.replaceAll('-', '')),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.black,
    ));
  }
}
