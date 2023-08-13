import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.onTap, required this.label});
  final VoidCallback onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30),
      child: GestureDetector(
        onTap: onTap,
        child: Material(
            shadowColor: AppColors.orange,
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            elevation: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.orange),
              child: Center(
                child: TextWidget(
                  text: label,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )),
      ),
    );
  }
}
