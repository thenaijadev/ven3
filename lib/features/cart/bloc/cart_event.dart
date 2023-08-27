part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartEventAddCartItem extends CartEvent {
  final Meal meal;
  CartEventAddCartItem({required this.meal});
}

class CartEventRemoveCartItem extends CartEvent {
  final FoodTypeItem item;
  CartEventRemoveCartItem({required this.item});
}
