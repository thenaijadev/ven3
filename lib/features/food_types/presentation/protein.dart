import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/features/home/presentation/widgets/food_page_view.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/data/models/food_type_item.dart';

class MeatScreen extends StatelessWidget {
  const MeatScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<FoodTypeItem> soups = [
      FoodTypeItem(
          price: 500,
          type: "Meat",
          name: "Fried Chicken",
          image: "assets/images/friedchicken.jpeg"),
      FoodTypeItem(
          price: 1200,
          type: "Meat",
          name: "Rotisorie",
          image: "assets/images/full_rotiserrie_chicken.jpeg"),
      FoodTypeItem(
          price: 900,
          type: "Meat",
          name: "Kpomo",
          image: "assets/images/pomo.jpg"),
      FoodTypeItem(
          price: 300,
          type: "Meat",
          name: "Eggs",
          image: "assets/images/boiled_eggs.jpg"),
      FoodTypeItem(
          price: 100,
          type: "Meat",
          name: "Asorted",
          image: "assets/images/asorted.jpg"),
    ];

    return Scaffold(
        body: FoodPageView(
      navigate: (p1) {
        Navigator.pushNamed(context, Routes.drinks);
      },
      category: soups,
    ));
  }
}
