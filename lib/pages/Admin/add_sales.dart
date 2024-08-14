import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/models/discount_model.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/services/fire_base.dart';
import 'package:funny_baby/widgets/custom_button.dart';
import 'package:funny_baby/widgets/custom_text_field.dart';

class AddSales extends StatefulWidget {
  const AddSales({super.key});
  static String id = 'AddSales';

  @override
  State<AddSales> createState() => _AddSalesState();
}

 String? image, category;
final TextEditingController saleController = TextEditingController();
bool loaded = false;
GlobalKey<FormState> fromKey = GlobalKey<FormState>();

class _AddSalesState extends State<AddSales> {
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: fromKey,
          child: Column(
            children: [
              CustomTextField(
                label: s.sale_desc,
                hint: s.enter_sale,
                controller: saleController,
              ),
              TextButton.icon(
                statesController: MaterialStatesController(),
                onPressed: () async {
                  image =
                      await FireBaseServices().uploadImage(saleController.text);

                  setState(() {
                    if (image != null) {
                      loaded = true;
                    }
                  });
                },
                icon: Icon(
                  !loaded ? Icons.upload : Icons.done,
                  color: blueColor,
                ),
                label:
                    !loaded ? Text(s.upload_image) : Text(saleController.text),
              ),
              CustomButton(
                buttonName: s.send,
                border: true,
                color: blueColor,
                txtcolor: Colors.white,
                onTap: () async {
                  if (fromKey.currentState!.validate() || loaded) {
                    await FireBaseServices().addSale(
                        DiscountModel(sale: saleController.text, image: image!));
                    log('add sale done');
                    saleController.clear();
                    setState(() {
                      image = null;
                      loaded = false;
                    });
                  } else {
                    log('sale not done');
                  }
                },
              )
            ],
          ),
        ));
  }
}
