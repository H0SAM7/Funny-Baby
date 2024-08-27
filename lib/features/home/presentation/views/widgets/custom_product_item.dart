import 'package:flutter/material.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/core/utils/app_styles.dart';
import 'package:funny_baby/features/home/presentation/views/product_details_view.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/custom_image_procduct.dart';
import 'package:go_router/go_router.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/${DetailsPage.id}', extra: productModel);
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
                    image: productModel.image,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          _truncateText(productModel.title, 4),
                          style: AppStyles.styleMedium18(context),
                          maxLines: 1,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(" \$ ${productModel.price}",
                            style: AppStyles.styleMedium18(context)),
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
