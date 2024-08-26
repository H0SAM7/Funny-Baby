import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/payment/presentation/manager/cubit/add_order_cubit.dart';

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
          CashPayment(items:items,),
        ],
      ),
    );
  }
}

class CashPayment extends StatelessWidget {
  const CashPayment({super.key, required this.items});
  final List<ProductModel> items ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async {
        BlocProvider.of<AddOrderCubit>(context).addOrder(items);
      },
      child: Container(
        width: 50,
        height: 50,
        color: Colors.amber,
      ),
    );
  }
}
