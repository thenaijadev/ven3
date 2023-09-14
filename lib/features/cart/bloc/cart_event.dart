part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartEventAddProduct extends CartEvent {
  final Product product;
  CartEventAddProduct({required this.product});
}

class CartEventRemoveCartItem extends CartEvent {
  final Product product;
  CartEventRemoveCartItem({required this.product});
}

class CartEventMealAddItemQuantity extends CartEvent {
  final MealItemModel mealItem;
  final int mealIndex;

  CartEventMealAddItemQuantity({
    required this.mealItem,
    required this.mealIndex,
  });
}

class CartEventMealReduceItemQuantity extends CartEvent {
  final MealItemModel mealItem;
  final int mealIndex;

  CartEventMealReduceItemQuantity({
    required this.mealItem,
    required this.mealIndex,
  });
}
