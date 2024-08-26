import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:funny_baby/features/home/data/home_repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit() : super(AddOrderInitial());

  Future<void> addOrder(List<ProductModel> items) async {
    emit(AddOrderLoading());
    try {
      List<Map<String, dynamic>> itemsMap =
          items.map((item) => item.toMap()).toList();
      await firestore
          .collection('orders')
          .add(itemsMap as Map<String, dynamic>);
      log('adding done');
    } catch (e) {
      log('Error adding product: $e');
    }
  }
}
