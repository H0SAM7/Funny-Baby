
import 'package:flutter/material.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/adv_animation_bar.dart';

class CustomAdvWidget extends StatelessWidget {
  const CustomAdvWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * .188,
        width: size.width,
        child: AdvarticementsAnimationBar(
            color: const Color(0xFFCAF0F8),
            image: 'assets/Images/boyy.png',
            text: S.of(context).New_collection));
  }
}