
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:funny_baby/generated/l10n.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    
  final S s=S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          s.pay_now,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 20,
        ),
        const Icon(
          FontAwesomeIcons.bagShopping,
          color: Colors.white,
        ),
      ],
    );
  }
}
