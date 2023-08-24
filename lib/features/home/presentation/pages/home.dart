import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/features/home/data/models/food_category.dart';
import 'package:the_food_hub_nsk_nig/features/home/presentation/widgets/food_page_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FoodCategory> foods = [
    FoodCategory(
      name: "Swallow",
      image: "assets/images/swallow.jpg",
    ),
    FoodCategory(name: "Rice", image: "assets/images/rice.jpg"),
    FoodCategory(name: "Pasta", image: "assets/images/pasta.jpg"),
  ];

  void navigate(String route, String type) {
    Navigator.pushNamed(context, Routes.foodType, arguments: type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FoodPageView(
        navigate: navigate,
        category: foods,
      ),
    );
  }
}
