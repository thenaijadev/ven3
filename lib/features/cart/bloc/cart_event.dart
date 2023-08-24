part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartEventAddCartItem extends CartEvent {
  final FoodTypeItem item;
  CartEventAddCartItem({required this.item});
}
