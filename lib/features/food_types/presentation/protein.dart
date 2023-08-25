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
          type: "Meat",
          name: "Fried Chicken",
          image: "assets/images/friedchicken.jpeg"),
      FoodTypeItem(
          type: "Meat",
          name: "Rotisorie",
          image: "assets/images/full_rotiserrie_chicken.jpeg"),
      FoodTypeItem(
          type: "Meat", name: "Kpomo", image: "assets/images/pomo.jpg"),
      FoodTypeItem(
          type: "Meat", name: "Eggs", image: "assets/images/boiled_eggs.jpg"),
      FoodTypeItem(
          type: "Meat", name: "Asorted", image: "assets/images/asorted.jpg"),
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
