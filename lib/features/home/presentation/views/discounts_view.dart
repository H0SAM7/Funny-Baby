import 'package:flutter/material.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/discounts_view_body.dart';

class DiscountsView extends StatelessWidget {
  const DiscountsView({super.key});


  @override
  Widget build(BuildContext context) {
    // var cubit = BlocProvider.of<AllProductsCubit>(context);
    // cubit.getFavoList;
    return const Scaffold(body: DiscountsViewBody());
  }
}
