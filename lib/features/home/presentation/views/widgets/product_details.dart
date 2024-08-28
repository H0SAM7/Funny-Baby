import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/core/utils/app_styles.dart';
import 'package:funny_baby/core/widgets/custom_show_dialog2.dart';
import 'package:funny_baby/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/core/widgets/custom_widgets.dart';
import 'package:funny_baby/features/cart/presentation/views/widgets/add_to_cart_button.dart';
import 'package:funny_baby/core/widgets/price_details.dart';
import 'package:go_router/go_router.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails(
      {super.key, required this.productModel, required this.s});

  final ProductModel productModel;
  final S s;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildSectionTitle(productModel.title),
            ),
            const SizedBox(
              height: 5,
            ),
            Text('• ${productModel.description}',
                style: AppStyles.styleRegular16(context)),
            buildSectionTitle(s.size),
            const SizedBox(
              height: 5,
            ),
            Text('• ${productModel.size}',
                style: AppStyles.styleRegular16(context)),
            const SizedBox(
              height: 5,
            ),
            buildSectionTitle(s.price_after_discount),
            PriceDetails(
              productModel: productModel,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                        child: const AddToCartWidget(),
                        onPressed: () async {
                          // String url =
                          //     'https://wa.me/+201065103026?text=${productModel.parcode} كود المنتج';
                          // final Uri uri = Uri.parse(url);
                          // await launchUrlMethod(uri);
                          await BlocProvider.of<CartCubit>(context)
                              .addItem(productModel);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ConfirmationDialog2(
                                    title: '',
                                    content: 'تم اضافة المنتج الي السلة',
                                    onConfirm: () {
                                      GoRouter.of(context).pop();
                                      GoRouter.of(context).pop();
                                    },
                                    action: 'موافق');
                              });
                          log('add item to cart done');
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
