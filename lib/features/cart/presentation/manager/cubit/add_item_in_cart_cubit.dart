import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:funny_baby/core/models/cart_item_model.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
part 'add_item_in_cart_state.dart';

class AddItemCartCubit extends Cubit<AddCartItemState> {
  AddItemCartCubit() : super(AddNotesInitial());

  addNote(CartModel cartItem) async {
    emit(AddNotesLoading());

    try {
      var noteBox = Hive.box<CartModel>('cart');
      await noteBox.add(cartItem);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesFailure(errorMessage: e.toString()));
    }
  }

  List<CartModel>? items;
  fetchAllItems() {
    var itemsBox = Hive.box<CartModel>('cart');
    items = itemsBox.values.toList();
  }
}
