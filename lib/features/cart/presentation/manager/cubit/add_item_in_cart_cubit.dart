import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:funny_baby/core/models/product_model.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
part 'add_item_in_cart_state.dart';

class AddItemCartCubit extends Cubit<AddCartItemState> {
  AddItemCartCubit() : super(AddNotesInitial());

  addItem(ProductModel cartItem) async {
    emit(AddCartLoading());

    try {
      var noteBox = Hive.box<ProductModel>('cart');
      await noteBox.add(cartItem);
      emit(AddCartSuccess());
    } catch (e) {
      emit(AddCartFailure(errorMessage: e.toString()));
    }
  }

  List<ProductModel>? items;
  fetchAllItems() {
  
  var itemsBox = Hive.box<ProductModel>('cart');
  items = itemsBox.values.toList();
  emit(FeachAllItemsSuccess());

  }
}
