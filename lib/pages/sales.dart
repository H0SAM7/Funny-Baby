import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/cubit/get_products_cubit.dart';
import 'package:funny_baby/widgets/sales_body.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<GetProductCubit>(context);
    cubit.getFavoList;
    return const Scaffold(body: SalesBody());
  }
}
