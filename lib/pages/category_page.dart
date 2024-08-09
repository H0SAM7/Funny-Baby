import 'package:flutter/material.dart';
import 'package:funny_baby/models/product_model.dart';
import 'package:funny_baby/services/fire_base.dart';
import 'package:funny_baby/widgets/category_grid_view.dart';
import 'package:funny_baby/widgets/custom_loading_indecator.dart';


class CategoryPage extends StatelessWidget {
  static String id='categoryPage';

  const CategoryPage({super.key});
  @override
  Widget build(BuildContext context) {


  
    String categoryName =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
         padding: const EdgeInsets.only(left: 6, right: 6, top: 20,),
        child: FutureBuilder<List<ProductModel>>(
         //  BlocProvider.of<GetProductCubit>(context).getProducts()
          future:FireBaseServices().getCategoryProducts(categoryName, ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return CategoryGridView(products: products);
            } else {
              return const Center(
                child: CustomLoadingIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

