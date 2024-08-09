
import 'package:flutter/material.dart';
import 'package:funny_baby/models/product_model.dart';

class ImageDetailesWidget extends StatelessWidget {
  const ImageDetailesWidget({
    super.key,
    required this.size,
    required this.productModel,
  });

  final Size size;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.network(productModel.image).image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
