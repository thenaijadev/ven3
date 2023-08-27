part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartEventAddCartMeal extends CartEvent {
  final Meal meal;
  CartEventAddCartMeal({required this.meal});
}

class CartEventRemoveCartItem extends CartEvent {
  final FoodTypeItem item;
  CartEventRemoveCartItem({required this.item});
}
