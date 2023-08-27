import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/features/cart/presentation/widgets/cart_item_meal.dart';
import 'package:the_food_hub_nsk_nig/features/cart/presentation/widgets/meal_details.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget(
      {Key? key,
      required this.onDelete,
      required this.index,
      required this.name,
      required this.image})
      : super(key: key);
  final int index;
  final VoidCallback onDelete;
  final String name;
  final String image;
  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget>
    with SingleTickerProviderStateMixin {
  bool showDetails = false;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0), // Start from below
      end: const Offset(0.0, 0.0), // Slide to zero offset (visible position)
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleDetails() {
    setState(() {
      showDetails = !showDetails;
      if (showDetails) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartItemMeal(
          image: widget.image,
          name: widget.name,
          onShowDetails: _toggleDetails,
          showDetailsIcon: showDetails
              ? Icons.keyboard_arrow_up_rounded
              : Icons.keyboard_arrow_down_rounded,
          onDelete: widget.onDelete,
        ),
        SlideTransition(
          position: _slideAnimation,
          child: Visibility(
            visible: showDetails,
            child: MealDetails(mealItemIndex: widget.index),
          ),
        ),
      ],
    );
  }
}
