import 'package:flutter/material.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/core/widgets/custom_loading_indecator.dart';


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
                          const CustomLoadingIndicator(),
                          Text(
                            S.of(context).check_inbox,
                            style: const TextStyle(fontSize: 10),
                          )
                        ],
                      )
                    : const CustomLoadingIndicator(),
              ),
            ),
          ),
      ],
    );
  }
}

