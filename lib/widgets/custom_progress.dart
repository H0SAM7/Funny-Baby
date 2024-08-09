import 'package:flutter/material.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:loading_indicator/loading_indicator.dart';

// ignore: must_be_immutable
class CustomProgressHUD extends StatelessWidget {
  final bool inAsyncCall;
  final Widget child;
  final AlignmentGeometry indicatorAlignment;
 final bool verify;
const CustomProgressHUD({super.key, 
    required this.inAsyncCall,
    required this.child,
    this.indicatorAlignment = Alignment.bottomCenter,
    this.verify = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (inAsyncCall)
          Positioned.fill(
            child: Align(
              alignment: indicatorAlignment,
              child: Container(
                child: verify
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomLoadingIndicator(),
                          Text(
                            S.of(context).check_inbox,
                            style: const TextStyle(fontSize: 10),
                          )
                        ],
                      )
                    : CustomLoadingIndicator(),
              ),
            ),
          ),
      ],
    );
  }
}

// ignore: must_be_immutable
class CustomLoadingIndicator extends StatelessWidget {
  CustomLoadingIndicator({super.key, this.h = 24, this.w = 32});
  double? h;
  double? w;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: h,
      width: w,
      child: LoadingIndicator(
          indicatorType: Indicator.lineScalePulseOut,
          colors: [
            const Color.fromARGB(255, 233, 156, 162),
            Color.fromARGB(255, 249, 142, 151)
          ]),
    ));
  }
}
