

import 'package:flutter/material.dart';
import 'package:funny_baby/core/widgets/custom_loading_indecator.dart';

class LoadingOrderDialog extends StatelessWidget {
  final String title;
  const LoadingOrderDialog({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: const CustomLoadingIndicator(),
   
    );
  }
}




