import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:funny_baby/features/cart/presentation/views/widgets/cart_view_item.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          CartViewItem(),
          CartViewItem(),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              
            ),
            child: 
            Icon(FontAwesomeIcons.cartArrowDown,)
          )
        ],
      ),
    );
  }
}
