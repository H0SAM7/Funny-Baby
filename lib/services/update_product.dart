// import 'dart:developer';

// import 'package:funny_baby/helper/api.dart';
// import 'package:funny_baby/models/product_model.dart';

// class UpdateProductService {
//   Future<dynamic> UpdateProduct(
//       {required int id,
//       required String title,
//       required String description,
//       required String price,
//       required String category,
//       required String image}) async {
//     log('the id is$id');
//     Map<String, dynamic> data =
//         await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
//       'title': title,
//       'description': description,
//       'price': price,
//       'category': category,
//       'image': image
//     });
//     log('the updated data is${ProductModel.fromjson(data)}');
//     return ProductModel.fromjson(data);
//   }
// }



// // import 'dart:developer';

// // import 'package:funny_baby/helper/api.dart';
// // import 'package:funny_baby/models/product_model.dart';

// // class UpdateProductService {
// //   Future<dynamic> UpdateProduct(
// //       {required int id,
// //       required String title,
// //       required String description,
// //       required String price,
// //        String? category,
// //       required String image}) async {
// //     log('the id is$id');
// //     Map<String, dynamic> data =
// //         await Api().put(url: 'https://api.escuelajs.co/api/v1/products/$id', body: {
// //       'title': title,
// //       'description': description,
// //       'price': price,
    
// //     });
// //     log('the updated data is${ProductModel.fromjson(data)}');
// //     return ProductModel.fromjson(data);
// //   }
// // }
