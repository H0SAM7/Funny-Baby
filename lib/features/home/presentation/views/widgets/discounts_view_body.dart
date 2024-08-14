import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/core/models/discount_model.dart';
import 'package:funny_baby/features/home/presentation/manager/discounts_cubit/discounts_cubit.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/services/fire_base.dart';
import 'package:funny_baby/widgets/custom_loading_indecator.dart';
import 'package:funny_baby/widgets/sales_widget.dart';

class DiscountsViewBody extends StatelessWidget {
  const DiscountsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscountsCubit, DiscountsState>(
      builder: (context, state) {
        if (state is DiscountsSuccess) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListView.builder(
              clipBehavior: Clip.none,
              itemCount: state.discounts.length,
              itemBuilder: (context, index) {
                return SalesWidget(
                  sale: state.discounts[index],
                );
              },
            ),
          );
        }
        else if(state is DiscountsFailure){
               return Center(child: Text(S.of(context).Error_loading_products));
        }
        else{
         return const Center(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
