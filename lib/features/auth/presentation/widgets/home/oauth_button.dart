import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';

class OAuthButton extends StatelessWidget {
  const OAuthButton(
      {super.key,
      required this.image,
      required this.label,
      required this.onTap,
      this.verticalPadding = 15});
  final String image;
  final String label;
  final VoidCallback onTap;
  final double verticalPadding;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding,
            ),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Image.asset(
                    "assets/images/$image.png",
                    width: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                TextWidget(
                  text: label,
                  fontSize: 21,
                ),
              ],
            )),
      ),
    );
  }
}
