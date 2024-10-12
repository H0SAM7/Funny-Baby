import 'package:flutter/material.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/product_details.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/image_product_details.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody(
      {super.key, required this.productModel, required this.s});

  final ProductModel productModel;
  final S s;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
          ImageProductDetails(productModel: productModel),
         // const Divider(thickness: .5,),
          ProductDetails(productModel: productModel, s: s),
        ],
      ),
    );
  }
}
