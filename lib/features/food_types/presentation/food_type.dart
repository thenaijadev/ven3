import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/features/cart/models/meal_item.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/data/models/food.dart';
import 'package:the_food_hub_nsk_nig/features/home/presentation/widgets/food_page_view.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/data/models/food_type.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/data/models/food_type_item.dart';

class FoodTypeScreen extends StatelessWidget {
  const FoodTypeScreen({super.key, required this.food});
  final Food food;
  @override
  Widget build(BuildContext context) {
    List<FoodType> foodTypes = [
      FoodType(type: "Swallow", items: [
        FoodTypeItem(
            price: 230,
            type: "Swallow",
            name: "Amala",
            image: "assets/images/amala.jpg"),
        FoodTypeItem(
            price: 400,
            type: "Swallow",
            name: "Semo",
            image: "assets/images/semo.jpg"),
        FoodTypeItem(
            price: 1200,
            type: "Swallow",
            name: "Fufu",
            image: "assets/images/fufu.jpg"),
        FoodTypeItem(
            price: 900,
            type: "Swallow",
            name: "Eba",
            image: "assets/images/eba.jpg"),
      ]),
      FoodType(type: "Rice", items: [
        FoodTypeItem(
            price: 700,
            type: "Rice",
            name: "Rice and stew",
            image: "assets/images/riceandstew.jpg"),
        FoodTypeItem(
            price: 900,
            type: "Rice",
            name: "Coconut Rice",
            image: "assets/images/coconut_rice.jpg"),
        FoodTypeItem(
            price: 400,
            type: "Rice",
            name: "Fried rice",
            image: "assets/images/fried_rice.jpg"),
        FoodTypeItem(
            price: 700,
            type: "Rice",
            name: "Jollof",
            image: "assets/images/jollof.jpg"),
      ]),
      FoodType(type: "Pasta", items: [
        FoodTypeItem(
            price: 200,
            type: "Pasta",
            name: "Spag with sauce",
            image: "assets/images/spag_with_sauce.jpeg"),
        FoodTypeItem(
            price: 1300,
            type: "Pasta",
            name: "Stir fried spag",
            image: "assets/images/stir_fried_spag.jpg"),
      ]),
    ];
    List<Food> category = [];
    for (var element in foodTypes) {
      if (element.type == food.name) {
        category = [...element.items];
      }
    }

    return Scaffold(
        body: FoodPageView(
      navigate: (p1) {
        final List<MealItemModel> theMeal = [];
        final meal = MealItemModel(
            name: p1.name,
            id: p1.id,
            price: p1.price!,
            amount: 1,
            image: p1.image);
        theMeal.add(meal);
        if (p1.type == "Swallow") {
          Navigator.pushNamed(context, Routes.soups, arguments: theMeal);
        } else {
          Navigator.pushNamed(context, Routes.meats, arguments: theMeal);
        }
      },
      category: category,
    ));
  }
}
