
import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/models/order_model.dart';

class OrdersListViewItem extends StatelessWidget {
  const OrdersListViewItem({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: blueColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          
          children: [
          Row(
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('name:${order.customerName}', style: const TextStyle(fontSize: 16, color: Colors.white)),
              const SizedBox(width: 50,),
               Text('phone:${order.customerPhone}', style: const TextStyle(fontSize: 14, color: Colors.white)),
            ],
          ),
         
          Text('#${order.products.length}', style: const TextStyle(fontSize: 14, color: Colors.white)),
        ],)
      ),
    );
  
  }
}