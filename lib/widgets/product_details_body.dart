import 'package:flutter/material.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/models/product_model.dart';
import 'package:funny_baby/widgets/animated_details_product.dart';
import 'package:funny_baby/widgets/custom_arrow_button.dart';
import 'package:funny_baby/widgets/image_details.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    super.key,
    required this.size,
    required this.productModel,
    required bool isVisible,
    required this.s,
  }) : _isVisible = isVisible;

  final Size size;
  final ProductModel productModel;
  final bool _isVisible;
  final S s;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageDetailesWidget(size: size, productModel: productModel),
        customArrowButton(size: size),
        AnimatedDetailsWidget(
            size: size, isVisible: _isVisible, productModel: productModel, s: s)
      ],
    );
  }
}
