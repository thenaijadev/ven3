import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: 500,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: AppColors.orange),
      child: const Row(
        children: [
          TextWidget(
            text: "Category1",
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          )
        ],
      ),
    );
  }
}
