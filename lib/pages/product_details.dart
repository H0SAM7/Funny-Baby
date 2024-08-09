
import 'package:flutter/material.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/helper/helper_functions.dart';
import 'package:funny_baby/models/product_model.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/widgets/custom_widgets.dart';
import 'package:funny_baby/widgets/image_details.dart';
import 'package:funny_baby/widgets/pay_now.dart';


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
        child: Stack(
          children: [
            ImageDetailesWidget(size: size, productModel: productModel),
            // Positioned(
            //   top: size.height * 0.05,
            //   left: size.width * 0.05,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: const Color.fromARGB(255, 223, 125, 145).withOpacity(0.8),
            //       borderRadius: BorderRadius.circular(15),
            //     ),
            //     child: IconButton(
            //       icon: const Icon(Icons.arrow_forward, color: Colors.white),
            //       onPressed: () => Navigator.of(context).pop(),
            //     ),
            //   ),
            // ),
            Positioned(
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
                      child: Container(
                        // height: size.height * .45,
                        width: size.width * .8,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 223, 125, 145)
                              .withOpacity(0.8),
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
                              Row(
                                children: [
                                  Text(
                                    '• \$${discount(productModel.price, productModel.discount)}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: size.width * .05),
                                  Text(
                                    '\$${productModel.price}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Container(
                                    width: size.width * .4,
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
                                    decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
            )
          ],
        ),
      ),
    );
  }



}
