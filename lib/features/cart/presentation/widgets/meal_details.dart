import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_food_hub_nsk_nig/features/cart/bloc/cart_bloc.dart';
import 'package:the_food_hub_nsk_nig/features/cart/presentation/widgets/meal_item.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.mealItemIndex});
  final int mealItemIndex;

  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = context.read<CartBloc>();

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return state is CartStateItemAdded
            ? SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: state.meals[mealItemIndex].meals.length,
                  itemBuilder: (context, index) {
                    return MealItem(
                      onIncrease: () {
                        cartBloc.add(CartEventMealAddItemQuantity(
                            mealIndex: mealItemIndex,
                            mealItem: state.meals[mealItemIndex].meals[index]));
                      },
                      onReduce: () {
                        cartBloc.add(CartEventMealReduceItemQuantity(
                            mealIndex: mealItemIndex,
                            mealItem: state.meals[mealItemIndex].meals[index]));
                      },
                      price: state.meals[mealItemIndex].meals[index].price,
                      name: state.meals[mealItemIndex].meals[index].name,
                      quantity:
                          state.meals[mealItemIndex].meals[index].quantity,
                      image: state.meals[mealItemIndex].meals[index].image,
                    );
                  },
                ),
              )
            : const SizedBox();
      },
    );
  }
}
