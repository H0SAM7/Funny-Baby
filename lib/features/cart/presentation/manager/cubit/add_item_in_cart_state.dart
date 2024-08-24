part of 'add_item_in_cart_cubit.dart';

@immutable
sealed class AddCartItemState {}

final class AddNotesInitial extends AddCartItemState {}

final class AddNotesSuccess extends AddCartItemState {}

final class AddNotesLoading extends AddCartItemState {}

final class AddNotesFailure extends AddCartItemState {
  final String errorMessage;

  AddNotesFailure({required this.errorMessage});
}
