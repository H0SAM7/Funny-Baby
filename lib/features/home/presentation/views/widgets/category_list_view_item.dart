import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/core/widgets/custom_widgets.dart';
import 'package:funny_baby/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
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
            color: !isDarkMode ? Colors.white : Colors.transparent,
          ),
          child: ListTile(
            leading: SizedBox(
              height: 120,
              child: CustomImage(image: productModel.image),
            ),
            title: Text(
              _truncateText(productModel.title, 4),
              style: TextStyle(
                color: !isDarkMode ? blueColor : Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.amiri().fontFamily,
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
            
            subtitle: Text(
              "\$ ${productModel.price}",
              style: TextStyle(
                color: !isDarkMode ? blueColor : Colors.white,
                fontSize: 18,
              ),
            ),
            trailing: IconButton(
              onPressed: () async {
                await BlocProvider.of<CartCubit>(context).addItem(productModel);
                showSnackbar(context, 'تم اضافة المنتج الي السلة');
              },
              icon: Icon(
                FontAwesomeIcons.cartShopping,
                color: !isDarkMode ? blueColor : Colors.white,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          )),
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
