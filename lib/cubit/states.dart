import 'package:funny_baby/models/product_model.dart';

class StoreStates{}
class LodingProductsState extends StoreStates{}
class ProductsLoadedSucccessfuly extends StoreStates{
  ProductsLoadedSucccessfuly( this.listProducts);
  List<ProductModel> listProducts ;
}
class ProductErrorLoading extends StoreStates{}
class HomeState extends StoreStates{}
class NotFavuritState extends StoreStates{}
class FavuritState extends StoreStates{}
class NoSearchstate extends StoreStates{}

class ProductFound extends StoreStates{
  ProductModel productModel;
  ProductFound(this.productModel);}
class ProductNotFound extends StoreStates{}