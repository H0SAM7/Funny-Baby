import 'package:flutter/material.dart';
import 'package:funny_baby/models/product_model.dart';
import 'package:funny_baby/services/fire_base.dart';
import 'package:funny_baby/widgets/custom_card.dart';
import 'package:funny_baby/widgets/custom_progress.dart';

class categoryPage extends StatelessWidget {
  static String id='categoryPage';
  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    double itemSpacing = size.width * 0.002; // Responsive item spacing
    double childAspectRatio =
        (size.width / 2) / (size.height * .53); // Adjust aspect ratio
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
              return GridView.builder(
            
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                  childAspectRatio: 1 / 2.1,
                  mainAxisSpacing: 7,
                  crossAxisSpacing:3,
                ),
                itemBuilder: (context, index) {
                  return CustomCard(
                    productModel: products[index],
                  );
                },
              );
            } else {
              return Center(
                child: CustomLoadingIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

