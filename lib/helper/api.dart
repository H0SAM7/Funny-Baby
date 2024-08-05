import 'dart:developer';


import 'package:dio/dio.dart';


class Api{

Future<dynamic> get({required String url, })async{
 // Map<String, String> headers = {};

   
   try {
      Response response = await Dio().get(url,);

    return response.data;

    } on DioException catch (e) {
       log(e.toString());

      throw Exception(e.toString());
    } catch (e) {
      log(e.toString());
      throw Exception('oops! there was error please try later');
    }
}






Future<dynamic> post({required String url,required dynamic body,String? token})async{
  Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
  try {
  Response response = await Dio().post(url, data: body,options: Options(
    headers: headers
  ));
        Map<String, dynamic> data = response.data;

  return data;
} on DioException catch (e) {
       log(e.toString());

      throw Exception(e.toString());
    } catch (e) {
      log(e.toString());
      throw Exception('oops! there was error ');
    }
}



Future<dynamic> put({required String url,required dynamic body,String? token})async{
  Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
        log('url = $url body = $body token = $token ');

   
  try {
  Response response = await Dio().put(url, data: body,options: Options(
    headers: headers
  ));
  Map<String, dynamic> data = response.data;
  log('the update on url $url is sucsess');
  return data;
  
} on DioException catch (e) {
       log(e.toString());

      throw Exception(e.toString());
    } catch (e) {
      log(e.toString());
      throw Exception('oops! there was error ');
    }
}


}
