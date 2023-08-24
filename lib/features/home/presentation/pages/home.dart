import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/features/home/presentation/widgets/food_page_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    "assets/images/swallow.jpg",
    "assets/images/rice.jpg",
    "assets/images/pasta.jpg"
  ];
  List<String> foods = ["Swallow", "Rice", "Pasta"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FoodPageView(images: images, optionLabels: foods),
    );
  }
}
