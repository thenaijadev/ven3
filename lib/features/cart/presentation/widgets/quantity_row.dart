import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/cart/presentation/widgets/quantity_button.dart';

class QuantityRow extends StatelessWidget {
  const QuantityRow(
      {super.key,
      required this.onReduce,
      required this.onIncrease,
      required this.quantity});
  final VoidCallback onReduce;
  final VoidCallback onIncrease;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuantityButton(
          onTap: onReduce,
          isMinus: true,
        ),
        const SizedBox(
          width: 12,
        ),
        TextWidget(
          text: "$quantity",
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          width: 12,
        ),
        QuantityButton(
          onTap: onIncrease,
          isMinus: false,
        )
      ],
    );
  }
}
