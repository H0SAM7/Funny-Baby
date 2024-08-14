
import 'package:flutter/material.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/widgets/custom_card.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
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
        return CustomCard(
          productModel: products[index],
        );
      },
    );
  }
}

