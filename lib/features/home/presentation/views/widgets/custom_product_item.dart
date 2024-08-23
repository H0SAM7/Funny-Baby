import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/home/presentation/views/product_details_view.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/custom_image_procduct.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomProductItem extends StatefulWidget {
  const CustomProductItem({
    super.key,
    required this.productModel,
    this.details = true,
  });

  final bool details;
  final ProductModel productModel;

  @override
  State<CustomProductItem> createState() => _CustomProductItemState();
}

class _CustomProductItemState extends State<CustomProductItem> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push('/${DetailsPage.id}', extra: widget.productModel);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.white
                  : const Color.fromARGB(115, 255, 255, 255),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomImage(
                    image: widget.productModel.image,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _truncateText(widget.productModel.title, 4),
                        style: TextStyle(
                          color: blueColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.amiri().fontFamily,
                          // fontFamily: GoogleFonts.amiri().fontFamily,
                          fontSize: 18,
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        " \$ ${widget.productModel.price}",
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
