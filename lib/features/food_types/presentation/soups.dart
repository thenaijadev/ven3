import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/features/home/presentation/widgets/food_page_view.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/data/models/food_type_item.dart';

class SoupsScreen extends StatelessWidget {
  const SoupsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<FoodTypeItem> soups = [
      FoodTypeItem(
          type: "Soup", name: "Efo", image: "assets/images/eforiro.jpg"),
      FoodTypeItem(
          type: "Soup", name: "Egusi", image: "assets/images/egusi.jpg"),
      FoodTypeItem(
          type: "Soup", name: "Nsala", image: "assets/images/nsala.jpg"),
      FoodTypeItem(
          type: "Soup", name: "Ewedu", image: "assets/images/ewedu.jpeg"),
      FoodTypeItem(type: "Soup", name: "Okro", image: "assets/images/okro.jpg"),
    ];

    return Scaffold(
        body: FoodPageView(
      navigate: (p1) {
        Navigator.pushNamed(context, Routes.meats);
      },
      category: soups,
    ));
  }
}
