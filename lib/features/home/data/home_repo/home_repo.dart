import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:funny_baby/core/errors/failure.dart';
import 'package:funny_baby/core/models/discount_model.dart';
import 'package:funny_baby/core/models/product_model.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

final FirebaseStorage storage = FirebaseStorage.instance;

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
  Future<Either<Failure, List<DiscountModel>>> getAllDiscounts();

}
