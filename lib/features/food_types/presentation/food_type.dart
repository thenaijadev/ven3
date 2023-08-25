import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
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
            type: "Swallow", name: "Amala", image: "assets/images/amala.jpg"),
        FoodTypeItem(
            type: "Swallow", name: "Semo", image: "assets/images/semo.jpg"),
        FoodTypeItem(
            type: "Swallow", name: "Fufu", image: "assets/images/fufu.jpg"),
        FoodTypeItem(
            type: "Swallow", name: "Eba", image: "assets/images/eba.jpg"),
      ]),
      FoodType(type: "Rice", items: [
        FoodTypeItem(
            type: "Rice",
            name: "Rice and stew",
            image: "assets/images/riceandstew.jpg"),
        FoodTypeItem(
            type: "Rice",
            name: "Coconut Rice",
            image: "assets/images/coconut_rice.jpg"),
        FoodTypeItem(
            type: "Rice",
            name: "Fried rice",
            image: "assets/images/fried_rice.jpg"),
        FoodTypeItem(
            type: "Rice", name: "Jollof", image: "assets/images/jollof.jpg"),
      ]),
      FoodType(type: "Pasta", items: [
        FoodTypeItem(
            type: "Pasta",
            name: "Spag with sauce",
            image: "assets/images/spag_with_sauce.jpeg"),
        FoodTypeItem(
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
        if (p1.type == "Swallow") {
          Navigator.pushNamed(context, Routes.soups);
        } else {
          Navigator.pushNamed(context, Routes.meats);
        }
      },
      category: category,
    ));
  }
}
