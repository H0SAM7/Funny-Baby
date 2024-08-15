
import 'package:flutter/material.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/custom_product_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
                
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
        childAspectRatio: 1 / 2.1,
        mainAxisSpacing: 7,
        crossAxisSpacing:3,
      ),
      itemBuilder: (context, index) {
        return CustomProductItem(
          productModel: products[index],
        );
      },
    );
  }
}

