// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:funny_baby/helper/api.dart';
// import 'package:funny_baby/models/product_model.dart';

// class AllProductService {
//   final String url = 'https://fakestoreapi.com/products';

//   Future<List<ProductModel>> getAllProducts() async {

//     try {
//       List<ProductModel> productsList = [];
//     List<dynamic> data = await Api().get(url: url);
     
//       for (int i = 0; i < data.length; i++) {
   

//         ProductModel productModel = ProductModel.fromjson((data[i]));

//         productsList.add(productModel);
//        // log(productModel.description);
//       }
//       return productsList;
//     } on DioException catch (e) {
    


//     throw Exception(e.response);
//     } catch (e) {
//       log(e.toString());
//       throw Exception(e.toString());
//     }
//   }
// }
