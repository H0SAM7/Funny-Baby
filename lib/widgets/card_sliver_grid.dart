
import 'package:flutter/material.dart';
import 'package:funny_baby/models/product_model.dart';
import 'package:funny_baby/widgets/custom_card.dart';

class CardSliverGrid extends StatelessWidget {
  const CardSliverGrid({
    super.key,
    required this.size,
    required this.childAspectRatio,
    required this.itemSpacing,
    required this.products,
  });

  final Size size;
  final double childAspectRatio;
  final double itemSpacing;
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: size.width > size.height ? 3 : 2,
        // childAspectRatio: 1 / 2.1,
        //   childAspectRatio: 1 / 2.1,
        // mainAxisSpacing: 7,
        // crossAxisSpacing:3,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: itemSpacing,
        crossAxisSpacing: itemSpacing,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CustomCard(productModel: products[index]);
        },
        childCount: products.length,
      ),
    );
  }
}
