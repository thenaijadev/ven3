import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/features/home/presentation/widgets/food_page_view.dart';
import 'package:the_food_hub_nsk_nig/features/foodType/data/models/food_type.dart';
import 'package:the_food_hub_nsk_nig/features/foodType/data/models/food_type_item.dart';

class FoodTypeScreen extends StatelessWidget {
  const FoodTypeScreen({super.key, required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    List<FoodType> foodTypes = [
      FoodType(type: "Swallow", items: [
        FoodTypeItem(name: "Amala", image: "assets/images/amala.jpg"),
        FoodTypeItem(name: "Semo", image: "assets/images/semo.jpg"),
        FoodTypeItem(name: "Fufu", image: "assets/images/fufu.jpg"),
        FoodTypeItem(name: "Eba", image: "assets/images/eba.jpg"),
      ]),
      FoodType(type: "Rice", items: [
        FoodTypeItem(
            name: "Rice and stew", image: "assets/images/riceandstew.jpg"),
        FoodTypeItem(
            name: "Coconut Rice", image: "assets/images/coconut_rice.jpg"),
        FoodTypeItem(name: "Fried rice", image: "assets/images/fried_rice.jpg"),
        FoodTypeItem(name: "Jollof", image: "assets/images/jollof.jpg"),
      ]),
      FoodType(type: "Pasta", items: [
        FoodTypeItem(
            name: "Spag with sauce",
            image: "assets/images/spag_with_sauce.jpeg"),
        FoodTypeItem(
            name: "Stir fried spag",
            image: "assets/images/stir_fried_spag.jpg"),
      ]),
    ];
    List category = [];
    for (var element in foodTypes) {
      if (element.type == type) {
        category = [...element.items];
      }
    }
    return Scaffold(
        body: FoodPageView(
      navigate: (p1) {},
      category: category,
    ));
  }
}
