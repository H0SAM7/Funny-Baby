import 'package:flutter/material.dart';
import 'package:funny_baby/generated/l10n.dart';

import 'package:funny_baby/models/product_model.dart';

import 'package:funny_baby/widgets/product_details_body.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});
  static const String id = 'DetailsPage';

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    // bool isarabic = isArabic(context);
    final s = S.of(context);
    final size = MediaQuery.of(context).size;
    final ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      body: GestureDetector(
        onTap: _toggleVisibility,
        child: ProductDetailsBody(
            size: size,
            productModel: productModel,
            isVisible: _isVisible,
            s: s),
      ),
    );
  }
}
