import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
        ),
        TextWidget(
          text: "Welcome to",
          fontSize: 53,
          fontWeight: FontWeight.w700,
        ),
        TextWidget(
          text: "Food hub",
          fontSize: 53,
          color: AppColors.orange,
          fontWeight: FontWeight.w700,
        ),
        TextWidget(
          text: "Fast delivery at your door step.",
          fontSize: 18,
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
