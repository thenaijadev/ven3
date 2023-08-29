import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/features/cart/models/meal_item.dart';
import 'package:the_food_hub_nsk_nig/features/home/presentation/widgets/food_page_view.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/data/models/food_type_item.dart';

class SoupsScreen extends StatelessWidget {
  const SoupsScreen({
    super.key,
    required this.mealList,
  });
  final List<MealItemModel> mealList;

  @override
  Widget build(BuildContext context) {
    List<FoodTypeItem> soups = [
      FoodTypeItem(
          price: 300,
          type: "Soup",
          name: "Efo",
          image: "assets/images/eforiro.jpg"),
      FoodTypeItem(
          price: 300,
          type: "Soup",
          name: "Egusi",
          image: "assets/images/egusi.jpg"),
      FoodTypeItem(
          price: 700,
          type: "Soup",
          name: "Nsala",
          image: "assets/images/nsala.jpg"),
      FoodTypeItem(
          price: 200,
          type: "Soup",
          name: "Ewedu",
          image: "assets/images/ewedu.jpeg"),
      FoodTypeItem(
          price: 300,
          type: "Soup",
          name: "Okro",
          image: "assets/images/okro.jpg"),
    ];

    return Scaffold(
        body: FoodPageView(
      navigate: (p1) {
        final List<MealItemModel> theMeal = [...mealList];
        final meal = MealItemModel(
            name: p1.name,
            id: p1.id,
            price: p1.price!,
            quantity: 1,
            image: p1.image);
        theMeal.add(meal);
        Navigator.pushNamed(context, Routes.meats, arguments: theMeal);
      },
      category: soups,
    ));
  }
}
