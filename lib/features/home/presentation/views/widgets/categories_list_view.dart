import 'package:flutter/material.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/category_list_view_item.dart';
class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        
        padding: EdgeInsets.zero,
        itemCount: products.length,
        itemBuilder: (context, ind) {
          return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: CategoryListViewProductItem(
              productModel: products[ind],
            ),
          );
        });
   
  }
}
