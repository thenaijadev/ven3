import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/data/models/food_type_item.dart';

import '../models/meal.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartStateItemAdded(meals: const [])) {
    on<CartEventAddCartMeal>((event, emit) {
      final state = this.state;
      if (state is CartStateItemAdded) {
        List<Meal> meals = [...state.meals, event.meal];
        print(meals);
        emit(CartStateItemAdded(meals: meals));
      }
    });

    // on<CartEventRemoveCartItem>((event, emit) {
    //   final state = this.state;
    //   if (state is CartStateItemAdded) {
    //     final items = state.items;
    //     items.remove(event.item);
    //     emit(CartStateItemAdded(items: items));
    //   }
    // });
  }
}
