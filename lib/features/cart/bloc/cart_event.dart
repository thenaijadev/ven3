part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartEventAddCartMeal extends CartEvent {
  final Meal meal;
  CartEventAddCartMeal({required this.meal});
}

class CartEventRemoveCartItem extends CartEvent {
  final Meal meal;
  CartEventRemoveCartItem({required this.meal});
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
