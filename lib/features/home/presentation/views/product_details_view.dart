import 'package:flutter/material.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/product_details_view_body.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.productModel});
  static const String id = 'DetailsPage';
  final ProductModel productModel;
  @override
    Widget build(BuildContext context) {
    // bool isarabic = isArabic(context);
    final s = S.of(context);

    return Scaffold(
      body: ProductDetailsBody(productModel: productModel, s: s),
    );
  }
}
