import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/features/admins/presentation/manager/admin_cubit/admin_cubit.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/core/widgets/custom_button.dart';
import 'package:funny_baby/core/widgets/custom_text_field.dart';
import 'package:funny_baby/core/widgets/custom_widgets.dart';


// ignore: must_be_immutable
class DeleteProductsPage extends StatelessWidget {
  DeleteProductsPage({super.key});
  static const String id = 'DeleteProductsPage';

  final TextEditingController idController = TextEditingController();

  String? image;
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(s.delete_products)),
      body: BlocListener<AdminCubit, AdminState>(
        listener: (context, state) {
          if (state is AdminSuccess) {
            showSnackbar(context, s.deleteSuccess);
            idController.clear();
          } else if (state is AdminFailure) {
            showSnackbar(context, s.please_fill_all_fields);
          }
        },
        child: RefreshIndicator(
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
                        await BlocProvider.of<AdminCubit>(context)
                            .deleteProduct(
                                parcode: idController.text.toString());
                        log('Delete product Done');
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
