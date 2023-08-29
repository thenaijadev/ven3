import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';

class AddNewMealButton extends StatelessWidget {
  const AddNewMealButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: onTap,
            child: const TextWidget(
              text: "Add New Meal",
              color: AppColors.orange,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
