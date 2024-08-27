
import 'package:flutter/material.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/core/helper/helper_functions.dart';


class PriceDetails extends StatelessWidget {
  const PriceDetails({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

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
        SizedBox(width: 10,),
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