import 'package:flutter/material.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/cart/presentation/views/widgets/cart_view_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
    required this.products, this.onPressed,
  });
final void Function()? onPressed;
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: products.length,
        itemBuilder: (context, ind) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: CartViewItem(
              product: products[ind],
              onPressed: onPressed,
            ),
          );
        });
  }
}
