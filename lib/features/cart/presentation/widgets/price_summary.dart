import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/features/cart/presentation/widgets/price_data_row.dart';

class PriceSummary extends StatelessWidget {
  const PriceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PriceDataRow(
          title: "Subtotal:",
          amount: "27.30",
        ),
        PriceDataRow(
          title: "Delivery:",
          amount: "10.30",
        ),
        PriceDataRow(
          title: "Total:",
          amount: "37.60",
        )
      ],
    );
  }
}
