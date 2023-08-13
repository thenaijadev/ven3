import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';

class SignInSignUpOptionText extends StatelessWidget {
  const SignInSignUpOptionText({
    super.key,
    required this.label,
    required this.alternative,
    required this.onAlternative,
    this.labelColor = Colors.white,
    this.altColor = Colors.white,
  });
  final String label;
  final String alternative;
  final VoidCallback onAlternative;
  final Color labelColor;
  final Color altColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            text: label,
            color: labelColor,
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: onAlternative,
            child: TextWidget(
              text: alternative,
              color: altColor,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
