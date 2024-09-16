
import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/generated/l10n.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({
    super.key,
    required this.isarabic,
    required this.s,
  });

  final bool isarabic;
  final S s;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          !isarabic ? s.funny : s.baby,
          style: TextStyle(
              color: funnyPinkColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
              fontSize: 28),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          isarabic ? s.funny : s.baby,
          style:  TextStyle(
              color: funnyBlueColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
              fontSize: 28),
        ),
      ],
    );
  }
}
