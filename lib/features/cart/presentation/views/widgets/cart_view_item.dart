import 'package:flutter/material.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/custom_image_procduct.dart';

class CartViewItem extends StatelessWidget {
  const CartViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CustomImage(image: 'image'),
      title: Text('Product Name'),
      subtitle: Text('Price'),
      trailing: Icon(Icons.delete),
    );
  }
}