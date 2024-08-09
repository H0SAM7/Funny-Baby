import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:funny_baby/generated/l10n.dart';

class PayNowWidget extends StatelessWidget {
  const PayNowWidget({
    super.key,
    required this.s,
    required this.size,
  });

  final S s;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          s.pay_now,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: size.width * .07,
        ),
        const Icon(
          FontAwesomeIcons.bagShopping,
          color: Colors.white,
        ),
      ],
    );
  }
}
