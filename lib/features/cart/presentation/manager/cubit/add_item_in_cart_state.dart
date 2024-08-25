part of 'add_item_in_cart_cubit.dart';

@immutable
sealed class AddCartItemState {}

final class AddNotesInitial extends AddCartItemState {}

final class AddCartSuccess extends AddCartItemState {}

final class AddCartLoading extends AddCartItemState {}

final class AddCartFailure extends AddCartItemState {
  final String errorMessage;

  AddCartFailure({required this.errorMessage});
}

final class FeachAllItemsSuccess extends AddCartItemState {}

final class FeachAllItemsFailure extends AddCartItemState {}
