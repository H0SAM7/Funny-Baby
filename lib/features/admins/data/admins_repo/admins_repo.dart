import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:funny_baby/core/models/discount_model.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:image_picker/image_picker.dart';
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final FirebaseStorage storage = FirebaseStorage.instance;
  final ImagePicker picker = ImagePicker();
abstract class AdminsRepo {
  
  Future<void> addProduct({required ProductModel productModel});
  Future<void> deleteProduct({required String parcode});
  Future<void> updateProduct({required ProductModel productModel});
  Future<void> addDiscount({required DiscountModel discountModel});
 // Future<void> deleteDiscount({required DiscountModel discountModel});
}
