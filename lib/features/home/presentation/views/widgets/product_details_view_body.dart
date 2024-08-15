import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/animated_details_product.dart';
import 'package:funny_baby/core/widgets/custom_icon_button.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/image_product_details.dart';

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
        ImageProductDetails(size: size, productModel: productModel),
        customIconButton(
          size: size,
          icon: Icon(Icons.arrow_forward, color: blueColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        AnimatedDetailsProduct(
            size: size, isVisible: _isVisible, productModel: productModel, s: s)
      ],
    );
  }
}
