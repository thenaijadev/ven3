import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem(
      {super.key, required this.name, required this.onTap});
  final String name;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: 500,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            TextWidget(
              text: name,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            )
          ],
        ),
      ),
    );
  }
}
