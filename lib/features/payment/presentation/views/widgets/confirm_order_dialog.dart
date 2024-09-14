import 'package:flutter/widgets.dart';
import 'package:funny_baby/core/widgets/custom_show_dialog2.dart';
import 'package:go_router/go_router.dart';

class ConfirmOrderDialog extends StatelessWidget {
  const ConfirmOrderDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConfirmationDialog2(
        title: 'تاكيد الاوردر',
        content:
            'تم طلب الاوردر بنجاح سيتم التواصل معكم لتاكيد الاوردر',
        action: 'موافق',
        onConfirm: () {
          GoRouter.of(context).pop();
          GoRouter.of(context).pop();
          GoRouter.of(context).pop();
        });
  }
}
