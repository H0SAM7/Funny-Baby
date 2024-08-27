import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
part 'cart_cubit_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  addItem(
    ProductModel cartItem,
  ) async {
    emit(AddCartLoading());

    try {
      var cartBox = Hive.box<ProductModel>('cart');
      await cartBox.add(cartItem);
      emit(AddCartSuccess());
    } catch (e) {
      emit(AddCartFailure(errorMessage: e.toString()));
    }
  }

  List<ProductModel> items = [];
  fetchAllItems() async {
    var itemsBox = Hive.box<ProductModel>('cart');
    items = itemsBox.values.toList();
    emit(FeachAllItemsSuccess());
  }

  clearCart() async {


  try {
    var cartBox = await Hive.openBox<ProductModel>('cart');
    
    await cartBox.clear(); // This clears all items from the box

  } catch (e) {
    log(e.toString());
  }
}

}
