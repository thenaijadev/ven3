import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:the_food_hub_nsk_nig/features/cart/models/meal_item.dart';

import '../models/meal.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartStateItemAdded(meals: const [])) {
    on<CartEventAddCartMeal>((event, emit) {
      final state = this.state;
      if (state is CartStateItemAdded) {
        List<Meal> meals = [...state.meals, event.meal];

        emit(CartStateItemAdded(meals: meals));
      }
    });

    on<CartEventRemoveCartItem>((event, emit) {
      final state = this.state;
      if (state is CartStateItemAdded) {
        List<Meal> meals = [
          ...state.meals,
        ];
        meals.remove(event.meal);
        emit(CartStateItemAdded(meals: meals));
      }
    });

    on<CartEventMealAddItemQuantity>((event, emit) {
      final state = this.state;
      if (state is CartStateItemAdded) {
        final mealIndex = event.mealIndex;

        final updatedList = state.meals[mealIndex].meals.map(
          (e) {
            if (e.id == event.mealItem.id) {
              return e.copyWith(
                  quantity: e.quantity + 1,
                  price: (e.price / e.quantity).round() * (e.quantity + 1));
            }

            return e;
          },
        ).toList();
        final stateMeals = List.of(state.meals);
        int price = 0;
        for (var element in updatedList) {
          price = element.price + price;
        }
        stateMeals[mealIndex] = Meal(meals: updatedList, price: price);
        emit(CartItemIsAdding());
        emit(CartStateItemAdded(
          meals: stateMeals,
        ));
      }
    });

    on<CartEventMealReduceItemQuantity>((event, emit) {
      final state = this.state;
      if (state is CartStateItemAdded) {
        final mealIndex = event.mealIndex;

        final updatedList = state.meals[mealIndex].meals.map(
          (e) {
            if (e.id == event.mealItem.id) {
              if (e.quantity > 1) {
                return e.copyWith(
                    quantity: e.quantity - 1,
                    price: (e.price / e.quantity).round() * (e.quantity - 1));
              }
            }
            return e;
          },
        ).toList();
        final stateMeals = List.of(state.meals);
        int price = 0;
        for (var element in updatedList) {
          price = element.price + price;
        }
        stateMeals[mealIndex] = Meal(meals: updatedList, price: price);
        emit(CartItemIsAdding());
        emit(CartStateItemAdded(meals: stateMeals));
      }
    });
  }
}
