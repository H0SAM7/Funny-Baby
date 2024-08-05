import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart'; // Correct import for Cubit
import 'package:funny_baby/cubit/states.dart';
import 'package:funny_baby/models/product_model.dart';
import 'package:funny_baby/services/fire_base.dart';

class GetProductCubit extends Cubit<StoreStates> {
  // Correct class declaration
  GetProductCubit() : super(LodingProductsState());

  List<ProductModel> searchHistory = [];

  List<ProductModel> listProducts = [];
    List<ProductModel> FavlistProducts = [];
  Future<List<ProductModel>> getProducts() async {
    try {
      listProducts = await FireBaseServices().getProducts();
      emit(ProductsLoadedSucccessfuly(listProducts));
      return listProducts;
    } catch (e) {
      emit(ProductErrorLoading());
      return Future.error(e);
    }
  }



// addTofavo(){
//     for (var i in listProducts) {
//       if(i.favorite==true && !FavlistProducts.contains(i)){
//         FavlistProducts.add(i);
//       }
  
//   }
  
  
// }


getFavoList(){
  for (var i in FavlistProducts) {
    log(i.title);
  }
}



ProductModel? search(String quary){
  for (var i in listProducts) {
    if(i.title.toLowerCase().contains(quary.toLowerCase())){
      searchHistory.add(i);
      // log(searchHistory);
      return i;
    }
 
    
  }
}



}
