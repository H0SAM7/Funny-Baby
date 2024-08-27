import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:funny_baby/features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});
  static String id = 'CartView';
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    BlocProvider.of<CartCubit>(context).fetchAllItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CartViewBody(),
    );
  }
}
