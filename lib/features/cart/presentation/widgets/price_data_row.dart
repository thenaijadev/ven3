import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';

class PriceDataRow extends StatelessWidget {
  const PriceDataRow({super.key, required this.title, required this.amount});
  final String title;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            text: title,
            fontWeight: FontWeight.bold,
          ),
          TextWidget(
            text: "₦$amount ",
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: AppColors.orange,
          )
        ],
      ),
    );
  }
}
