import 'package:flutter/material.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/payment/presentation/views/widgets/cash_payment.dart';

class PaymentOptionView extends StatelessWidget {
  const PaymentOptionView({super.key, required this.items});
  static String id = 'PaymentOptionView';
 final List<ProductModel> items ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:  Column(
        children: [
          CashPayment(items: items,),
        ],
      ),
    );
  }
}


