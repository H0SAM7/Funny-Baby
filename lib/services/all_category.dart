import 'dart:developer';

import 'package:dio/dio.dart';


class AllCategoryServices{
   final Dio dio;
   AllCategoryServices({required this.dio});

Future<List<dynamic>> getAllCategory()async{


  try {
  Response response=await dio.get('https://fakestoreapi.com/products/categories');
  

  List<dynamic> categoryList=response.data;
  
   
  return categoryList;
  
} 
on DioException catch (e) {
  String ErrMassage=e.response?.data['error']['message'];


    throw Exception(ErrMassage);
}
catch(e){
  log(e.toString());
  throw Exception('oops! there was error please try later');
}
  

}
}