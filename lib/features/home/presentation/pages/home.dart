import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/features/home/presentation/pages/food_page_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FoodPageView(),
    );
  }
}
