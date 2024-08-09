import 'package:flutter/material.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/helper/helper_functions.dart';
import 'package:funny_baby/models/product_model.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/widgets/custom_widgets.dart';
import 'package:funny_baby/widgets/image_details.dart';
import 'package:funny_baby/widgets/pay_nowButton.dart';
import 'package:funny_baby/widgets/price_details.dart';
import 'package:funny_baby/widgets/product_details_body.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});
  static const String id = 'DetailsPage';

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.size,
    required bool isVisible,
    required this.productModel,
    required this.s,
  }) : _isVisible = isVisible;

  final Size size;
  final bool _isVisible;
  final ProductModel productModel;
  final S s;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Padding(
        padding: EdgeInsets.only(
          top: size.height * .56,
          left: size.width * .1,
          right: size.width * .1,
        ),
        child: Column(
          children: [
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: productDetails(
                  size: size,
                  productModel: productModel,
                  s: s,
                  isVisible: _isVisible),
            ),
            if (!_isVisible)
              Text(
                s.click_to_view_details,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class productDetails extends StatelessWidget {
  const productDetails({
    super.key,
    required this.size,
    required this.productModel,
    required this.s,
    required bool isVisible,
  }) : _isVisible = isVisible;

  final Size size;
  final ProductModel productModel;
  final S s;
  final bool _isVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: size.height * .45,
      width: size.width * .8,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 223, 125, 145).withOpacity(0.8),
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
            Text(
              '• ${productModel.description}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            buildSectionTitle(s.size),
            Text(
              '• ${productModel.size}',
              style: const TextStyle(color: Colors.white),
            ),
            buildSectionTitle(s.price_after_discount),
            PriceDetails(productModel: productModel, size: size),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  width: size.width * .4,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      child: PayNowWidget(s: s, size: size),
                      onPressed: () async {
                        if (_isVisible) {
                          String url =
                              'https://wa.me/+201065103026?text=${productModel.parcode} كود المنتج';
                          final Uri uri = Uri.parse(url);
                          await launchUrlMethod(uri);
                        }
                      },
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

