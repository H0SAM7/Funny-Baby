import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:funny_baby/core/errors/failure.dart';
import 'package:funny_baby/core/models/order_model.dart';
import 'package:funny_baby/features/home/data/home_repo/home_repo.dart';
import 'package:meta/meta.dart';
part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit() : super(AddOrderInitial());

  Future<void> addOrder(OrderModel order) async {
    emit(AddOrderLoading());
    try {
      await firestore.collection('orders').add(order.toMap());
      emit(AddOrderSuccses());
      log('Order added successfully');
    } catch (e) {
      // Emit failure state, log the error, and throw an exception
      emit(AddOrderFailure(
          errMessage: FirebaseFailure.fromFirebaseException(e as Exception)
              .toString()));
      log('Error adding order: $e');
    }
  }
}
