import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:funny_baby/core/errors/failure.dart';
import 'package:funny_baby/core/models/discount_model.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/home/data/home_repo/home_repo.dart';

class HomeRepoImp extends HomeRepo {

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    try {
      QuerySnapshot querySnapshot =
          await firestore.collection('products').get();
      List<ProductModel> products = querySnapshot.docs
          .map((doc) => ProductModel.fromDocument(doc))
          .toList();
      return right(products);
    } catch (e) {
      log('Error getting products: $e');
      return left(FirebaseFailure.fromFirebaseException(e as Exception));
    }
  }

  @override
  Future<Either<Failure, List<DiscountModel>>> getAllDiscounts() async {
    try {
      QuerySnapshot querySnapshot = await firestore.collection('sales').get();
      List<DiscountModel> discounts = querySnapshot.docs
          .map((doc) => DiscountModel.fromDocument(doc))
          .toList();
      return right(discounts);
    } catch (e) {
      log('Error getting sales: $e');
      return left(FirebaseFailure.fromFirebaseException(e as Exception));
    }
  }

  
}
