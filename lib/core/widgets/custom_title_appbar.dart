
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
              color: blueColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
              fontSize: 28),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          isarabic ? s.funny : s.baby,
          style: const TextStyle(
              color: Color.fromARGB(255, 247, 109, 233),
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
              fontSize: 28),
        ),
      ],
    );
  }
}
