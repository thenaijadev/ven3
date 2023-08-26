import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/features/cart/presentation/widgets/cart_item_meal.dart';
import 'package:the_food_hub_nsk_nig/features/cart/presentation/widgets/meal_details.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    super.key,
    required this.onDelete,
  });
  final VoidCallback onDelete;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartItemMeal(
          onShowDetails: () {},
          onDelete: widget.onDelete,
        ),
        const MealDetails()
      ],
    );
  }
}
