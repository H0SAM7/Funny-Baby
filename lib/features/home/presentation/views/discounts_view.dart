import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/cubit/get_products_cubit.dart';
import 'package:funny_baby/features/home/presentation/manager/all_products_cubit/all_products_cubit.dart';
import 'package:funny_baby/features/home/presentation/manager/discounts_cubit/discounts_cubit.dart';
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
