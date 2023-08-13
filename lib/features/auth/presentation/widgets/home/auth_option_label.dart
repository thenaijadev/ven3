import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';

class AuthOptionLabel extends StatelessWidget {
  const AuthOptionLabel({
    super.key,
    this.label = "Sign In with",
    this.color = Colors.white,
    this.line = "assets/images/line.png",
  });
  final String label;
  final Color color;
  final String line;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Image.asset(line)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextWidget(
            text: label,
            fontSize: 12,
            color: color,
          ),
        ),
        Expanded(child: Image.asset(line))
      ],
    );
  }
}
