import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:the_food_hub_nsk_nig/features/cart/models/meal_item.dart';
import 'package:the_food_hub_nsk_nig/features/products/data/models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartStateItemAdded(products: const [])) {
    on<CartEventAddProduct>((event, emit) {
      final state = this.state;
      if (state is CartStateItemAdded) {
        List<Product> products = [...state.products, event.product];

        emit(CartStateItemAdded(products: products));
      }
    });

    on<CartEventRemoveCartItem>((event, emit) {
      final state = this.state;
      if (state is CartStateItemAdded) {
        List<Product> products = [
          ...state.products,
        ];
        products.remove(event.product);
        emit(CartStateItemAdded(products: products));
      }
    });

   
  }
}
