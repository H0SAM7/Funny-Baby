
import 'package:flutter/material.dart';
import 'package:funny_baby/helper/helper_functions.dart';
import 'package:funny_baby/models/product_model.dart';

class PriceDetails extends StatelessWidget {
  const PriceDetails({
    super.key,
    required this.productModel,
    required this.size,
  });

  final ProductModel productModel;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '• \$${discount(productModel.price, productModel.discount)}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: size.width * .05),
        Text(
          '\$${productModel.price}',
          style: const TextStyle(
            color: Colors.black,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }
}