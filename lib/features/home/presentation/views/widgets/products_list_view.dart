import 'package:flutter/material.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/custom_product_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
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
        mainAxisSpacing: 7,
        crossAxisSpacing: 3,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CustomProductItem(productModel: products[index]);
        },
        childCount: products.length,
      ),
    );
  }
}
