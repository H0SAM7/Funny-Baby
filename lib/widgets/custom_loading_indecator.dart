
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key, this.h = 24, this.w = 32});
  final double? h;
  final double? w;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: h,
      width: w,
      child: const LoadingIndicator(
          indicatorType: Indicator.lineScalePulseOut,
          colors: [
            Color.fromARGB(255, 233, 156, 162),
            Color.fromARGB(255, 249, 142, 151)
          ]),
    ));
  }
}
