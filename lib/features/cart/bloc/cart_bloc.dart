import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:the_food_hub_nsk_nig/features/foodType/data/models/food_type_item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartStateItemAdded(items: const [])) {
    on<CartEventAddCartItem>((event, emit) {
      final state = this.state;
      if (state is CartStateItemAdded) {
        final items = state.items;
        items.add(event.item);
        emit(CartStateItemAdded(items: items));
      } else {
        final List<FoodTypeItem> items = [];
        items.add(event.item);
        emit(CartStateItemAdded(items: items));
      }
    });
  }
}
