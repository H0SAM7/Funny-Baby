import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:funny_baby/core/models/product_model.dart';

class ImageProductDetails extends StatelessWidget {
  const ImageProductDetails({
    super.key,
    required this.size,
    required this.productModel,
  });

  final Size size;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: productModel.image,
      fit: BoxFit.fill,
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
