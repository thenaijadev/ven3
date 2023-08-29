import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/features/cart/bloc/cart_bloc.dart';
import 'package:the_food_hub_nsk_nig/features/cart/models/meal.dart';
import 'package:the_food_hub_nsk_nig/features/cart/models/meal_item.dart';
import 'package:the_food_hub_nsk_nig/features/home/presentation/widgets/food_page_view.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/data/models/food_type_item.dart';

class DrinksScreen extends StatelessWidget {
  const DrinksScreen({super.key, required this.mealList});
  final List<MealItemModel> mealList;

  @override
  Widget build(BuildContext context) {
    List<FoodTypeItem> drinks = [
      FoodTypeItem(
          price: 300,
          type: "Drink",
          name: "Coke",
          image: "assets/images/coke.jpg"),
      FoodTypeItem(
          price: 300,
          type: "Drink",
          name: "Fanta",
          image: "assets/images/fanta.jpg"),
      FoodTypeItem(
          price: 300,
          type: "Drink",
          name: "Sprite",
          image: "assets/images/sprite.jpg"),
      FoodTypeItem(
          price: 300,
          type: "Meat",
          name: "Water",
          image: "assets/images/water.jpg"),
    ];

    return Scaffold(
        body: FoodPageView(
      navigate: (p1) {
        final CartBloc cartBloc = context.read<CartBloc>();
        final List<MealItemModel> theMeal = [...mealList];
        final meal = MealItemModel(
            name: p1.name,
            id: p1.id,
            price: p1.price!,
            quantity: 1,
            image: p1.image);
        theMeal.add(meal);
        int price = 0;
        for (var element in theMeal) {
          price = element.price + price;
        }
        cartBloc.add(
            CartEventAddCartMeal(meal: Meal(meals: theMeal, price: price)));
        Navigator.pushNamed(context, Routes.cart);
      },
      category: drinks,
    ));
  }
}
