import 'package:funny_baby/helper/api.dart';
import 'package:funny_baby/models/product_model.dart';
class CategoryProductsServices {
  CategoryProductsServices();

  // final String url='https://fakestoreapi.com/products/category/';
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url:'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      ProductModel productModel = ProductModel.fromDocument((data[i]));
      productsList.add(productModel);
      // log(productModel.description);
    }
    return productsList;
  }
}
