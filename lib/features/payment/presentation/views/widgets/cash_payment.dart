import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/core/utils/app_styles.dart';
import 'package:funny_baby/features/payment/presentation/views/add_order_view.dart';
import 'package:go_router/go_router.dart';

class CashPayment extends StatelessWidget {
  const CashPayment({super.key, required this.items});
  final List<ProductModel> items;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
          GoRouter.of(context).push('/${AddOrderView.id}',extra: items);
        // var email = await SharedPreference().getString('email');
        // await BlocProvider.of<AddOrderCubit>(context).addOrder(items, email!);
        // showSnackbar(context, 'تم طلب الاوردر بنجاح سيتم التواصل معكم لتاكيد الاوردر');
        // GoRouter.of(context).pop();

      },
      child: Center(
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            color: blueColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text(
                'Cash',
                style: AppStyles.styleRegular16(context)
                    .copyWith(color: Colors.white),
              ),
              const Icon(
                FontAwesomeIcons.dollarSign,
                color: Colors.white,
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
