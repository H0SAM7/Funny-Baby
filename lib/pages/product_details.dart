import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/models/product_model.dart';
import 'package:funny_baby/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);
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
            Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.network(productModel.image).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.05,
              left: size.width * 0.05,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 223, 125, 145).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
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
                      duration: Duration(milliseconds: 500),
                      child: Container(
                        // height: size.height * .45,
                        width: size.width * .8,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 223, 125, 145).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: _buildSectionTitle(productModel.title),
                              ),
                              Text(
                                '• ${productModel.description}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                             
                              _buildSectionTitle(s.size),
                              Text(
                                '• ${productModel.size}',
                                style: const TextStyle(color: Colors.white),
                              ),
                              _buildSectionTitle(s.price_after_discount),
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
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              s.pay_now,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * .07,
                                            ),
                                            Icon(
                                              FontAwesomeIcons.bagShopping,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        onPressed: () async {
                                       if(_isVisible){
                                           await _launchFacebookPage(
                                              productModel.parcode.toString());
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
                        style: TextStyle(
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

  String discount(String price, double discount) {
    double discountPrice =
        double.parse(price) - (double.parse(price) * discount / 100);
    return discountPrice.toString();
  }

  Future<void> _launchFacebookPage(String idProduct) async {
    String url = 'https://wa.me/+201065103026?text=$idProduct كود المنتج';
    final Uri uri = Uri.parse(url);
    if (!await canLaunchUrl(uri)) {
      final bool launched =
          await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        log('Could not launch $url');
      }
    } else {
      log('Cannot launch URL: $url');
    }
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
