import 'package:funny_baby/core/models/product_model.dart';
import 'package:hive/hive.dart';
part 'cart_item_model.g.dart';

@HiveType(typeId: 0) //من 0 ل 255
class CartModel extends HiveObject {
  @HiveField(0) // ----> unique for per field in class
  final ProductModel product;
  @HiveField(1)
  final DateTime date;

  CartModel({required this.product, required this.date});
}
