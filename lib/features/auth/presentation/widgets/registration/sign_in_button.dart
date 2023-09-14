import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.orange),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.email,
                size: 30,
                color: AppColors.orange,
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: TextWidget(
                  text: "Sign Up",
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ],
          )),
    );
  }
}
