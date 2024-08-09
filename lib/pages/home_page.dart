
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/cubit/get_products_cubit.dart';
import 'package:funny_baby/cubit/states.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/models/product_model.dart';
import 'package:funny_baby/widgets/adv_widget.dart';
import 'package:funny_baby/widgets/card_sliver_grid.dart';
import 'package:funny_baby/widgets/custom_loading_indecator.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double itemSpacing = size.width * 0.002; // Responsive item spacing
    double childAspectRatio =
        (size.width / 2) / (size.height * .53); // Adjust aspect ratio
    return BlocBuilder<GetProductCubit, StoreStates>(
      builder: (context, state) {
        var cubit = BlocProvider.of<GetProductCubit>(context);
        cubit.getProducts();

        if (state is ProductsLoadedSucccessfuly) {
          List<ProductModel> products = state.listProducts;
          return CustomScrollView(
            clipBehavior: Clip.none,
            slivers: [
              SliverToBoxAdapter(
                  child: SizedBox(
                      height: size.height * .188,
                      width: size.width,
                      child: Advarticements(
                          color: const Color(0xFFCAF0F8),
                          image: 'assets/Images/boyy.png',
                          text: S.of(context).New_collection))),
              CardSliverGrid(
                  size: size,
                  childAspectRatio: childAspectRatio,
                  itemSpacing: itemSpacing,
                  products: products),
            ],
          );
        } else if (state is ProductErrorLoading) {
          return Center(child: Text(S.of(context).Error_loading_products));
        } else {
          return Center(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
