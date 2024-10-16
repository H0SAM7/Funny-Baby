import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/models/order_model.dart';
import 'package:go_router/go_router.dart';

import 'order_details.dart';

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
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context)
              .push('/${OrderDetails.id}', extra: order.products);
        },
        child: Container(
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(order.customerName,
                    style: const TextStyle(fontSize: 16, color: Colors.white)),
                Text(order.customerPhone,
                    style: const TextStyle(fontSize: 14, color: Colors.white)),
                Text('#${order.products.length}',
                    style: const TextStyle(fontSize: 14, color: Colors.white)),
              ],
            )),
      ),
    );
  }
}
