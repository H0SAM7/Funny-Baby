
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/features/cart/presentation/manager/cubit/add_item_in_cart_cubit.dart';
import 'package:funny_baby/features/cart/presentation/views/widgets/cart_list_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: .2,
            color: blueColor,
    
          ),
        ),
        child: Column(
          children: [
            BlocBuilder<AddItemCartCubit, AddCartItemState>(
              builder: (context, state) {
                if (state is FeachAllItemsSuccess) {
                  return Expanded(
                    child: CartListView(
                      products:
                          BlocProvider.of<AddItemCartCubit>(context).items!,
                       
                    ),
                  );
                } else {
                  return const Center(child: Text('No Items'));
                }
              },
            ),
            Container(
                height: 60,
                width: 200,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue,
                ),
                child: const Icon(
                    FontAwesomeIcons.cartShopping,
                ))
          ],
        ),
      ),
    );
  }
}
