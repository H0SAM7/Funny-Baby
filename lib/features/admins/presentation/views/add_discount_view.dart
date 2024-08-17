import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/models/discount_model.dart';
import 'package:funny_baby/features/admins/presentation/manager/admin_cubit/admin_cubit.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/services/fire_base_services.dart';
import 'package:funny_baby/core/widgets/custom_button.dart';
import 'package:funny_baby/core/widgets/custom_text_field.dart';
import 'package:funny_baby/core/widgets/custom_widgets.dart';

class AddDiscounts extends StatefulWidget {
  const AddDiscounts({super.key});
  static String id = 'AddSales';

  
  @override
  State<AddDiscounts> createState() => _AddDiscountsState();
}

String? image, category;
final TextEditingController saleController = TextEditingController();
bool loaded = false;
GlobalKey<FormState> fromKey = GlobalKey<FormState>();

class _AddDiscountsState extends State<AddDiscounts> {
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
        appBar: AppBar(),
        body: BlocListener<AdminCubit, AdminState>(
          listener: (context, state) {
            if (state is AdminSuccess) {
              saleController.clear();

              image = null;
              loaded = false;

              showSnackbar(context,'add sale done' );
            }
            else if(state is AdminFailure){
              showSnackbar(context,'add sale failed' );
            }
          },
          child: Form(
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
                    image = await FireBaseServices()
                        .uploadImage(saleController.text);

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
                  label: !loaded
                      ? Text(s.upload_image)
                      : Text(saleController.text),
                ),
                CustomButton(
                  buttonName: s.send,
                  border: true,
                  color: blueColor,
                  txtcolor: Colors.white,
                  onTap: () async {
                    if (fromKey.currentState!.validate() || loaded) {
                      await BlocProvider.of<AdminCubit>(context).addDiscount(
                          discountModel: DiscountModel(
                              sale: saleController.text, image: image!));
                      log('add sale done');
                    } else {
                      log('sale not done');
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
