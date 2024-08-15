import 'package:flutter/material.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/services/fire_base.dart';
import 'package:funny_baby/features/home/presentation/views/widgets/categories_list_view.dart';
import 'package:funny_baby/core/widgets/custom_loading_indecator.dart';


class CategoryProductsView extends StatelessWidget {
  static String id='categoryPage';

  const CategoryProductsView({super.key});
  @override
  Widget build(BuildContext context) {


  
    String categoryName =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
         padding: const EdgeInsets.only(left: 6, right: 6, top: 20,),
        child: FutureBuilder<List<ProductModel>>(
          future:FireBaseServices().getCategoryProducts(categoryName, ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return CategoriesListView(products: products);
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

