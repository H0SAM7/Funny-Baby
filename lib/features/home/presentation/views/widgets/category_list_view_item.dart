import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/home/presentation/views/product_details_view.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/custom_image_procduct.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryListViewProductItem extends StatelessWidget {
  const CategoryListViewProductItem({
    super.key,
    required this.productModel,
    this.details = true,
  });

  final bool details;
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/${DetailsPage.id}', extra: productModel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode
              ? Colors.white
              : const Color.fromARGB(115, 255, 255, 255),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: 120,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomImage(
                    
                    image: productModel.image),
                )),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _truncateText(productModel.title, 4),
                    style: TextStyle(
                      color: blueColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.amiri().fontFamily,
                      overflow: TextOverflow.ellipsis,
                      // fontFamily: GoogleFonts.amiri().fontFamily,
                      fontSize: 18,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    " \$ ${productModel.price}",
                    style: TextStyle(
                      fontSize: 18,
                      color: blueColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _truncateText(String text, int maxWords) {
    final words = text.split(' ');
    if (words.length <= maxWords) {
      return text;
    } else {
      return '${words.take(maxWords).join(' ')}...';
    }
  }
}
