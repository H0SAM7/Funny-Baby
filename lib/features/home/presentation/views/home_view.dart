import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_baby/features/home/presentation/manager/all_products_cubit/all_products_cubit.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/custom_adv_widget.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/products_list_view.dart';
import 'package:funny_baby/generated/l10n.dart';
import 'package:funny_baby/core/widgets/custom_loading_indecator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double itemSpacing = size.width * 0.002; // Responsive item spacing
    double childAspectRatio =
        (size.width / 2) / (size.height * .53);
    return BlocBuilder<AllProductsCubit, AllProductsState>(
      builder: (context, state) {
        if (state is AllProductsSuccess) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            slivers: [
              SliverToBoxAdapter(child: CustomAdvWidget(size: size)),
              ProductsListView(
                  size: size,
                  childAspectRatio: childAspectRatio,
                  itemSpacing: itemSpacing,
                  products: state.products),
            ],
          );
        } else if (state is AllProductsFailure) {
          return Center(child: Text(S.of(context).Error_loading_products));
        } else {
          return const Center(child: CustomLoadingIndicator());
        }
      },
    );
  }
}



