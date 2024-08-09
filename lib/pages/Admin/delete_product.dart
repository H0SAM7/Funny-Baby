import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/services/fire_base.dart';
import 'package:funny_baby/widgets/custom_button.dart';
import 'package:funny_baby/widgets/custom_text_field.dart';
import 'package:funny_baby/widgets/custom_widgets.dart';

// ignore: must_be_immutable
class DeleteProductsPage extends StatelessWidget {
  DeleteProductsPage({super.key});
  static String id = 'DeleteProductsPage';

  final TextEditingController idController = TextEditingController();

  String? image;
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

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
            key: fromKey,
            child: Column(
              children: [
                CustomTextField(
                  label: s.product_code,
                  hint: s.enter_product_code,
                  controller: idController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  buttonName: s.send,
                  border: true,
                  txtcolor: Colors.white,
                  color: blueColor,
                  onTap: () async {
                    if (fromKey.currentState!.validate()) {
                      await FireBaseServices()
                          .deleteProduct(idController.text.toString());
                      log('Delete product Done');

                      showSnackbar(context, s.deleteSuccess);
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

}
