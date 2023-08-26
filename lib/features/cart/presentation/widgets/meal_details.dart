import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/features/cart/presentation/widgets/meal_item.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [MealItem()],
    );
  }
}
