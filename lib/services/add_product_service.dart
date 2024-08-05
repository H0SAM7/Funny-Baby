// import 'dart:developer';

// import 'package:funny_baby/helper/api.dart';
// import 'package:funny_baby/models/product_model.dart';

// class AddProductService{

//   Future<dynamic> addProduct({  required String id,
//   required String title,
//   required String description,
//   required String price,
//   required String category,
//   required String image})async{
//  Map<String,dynamic> data= await  Api().post(url: 'https://fakestoreapi.com/products', body: {

//     'id': id,
//     'title': title,
//     'description': description,
//     'price': price,
//     'category': category,
//     'image': image


//   });
// log('the add product success');
//   return ProductModel.fromjson(data);
//   }
// }