import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_food_hub_nsk_nig/features/cart/bloc/cart_bloc.dart';
import 'package:the_food_hub_nsk_nig/features/cart/presentation/widgets/price_data_row.dart';

class PriceSummary extends StatelessWidget {
  const PriceSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        int totalPrice = 0;
        if (state is CartStateItemAdded) {
          for (var element in state.products) {
            totalPrice = double.parse(element.price!).round() *
                    int.parse(element.amount.toString()) +
                totalPrice;
          }
        }
        final deliveryFee = totalPrice * .1;

        return Column(
          children: [
            PriceDataRow(
              title: "Subtotal:",
              amount: "${totalPrice.round()}",
            ),
            PriceDataRow(
              title: "Delivery:",
              amount: "${deliveryFee.round()}",
            ),
            PriceDataRow(
              title: "Total:",
              amount: "${(totalPrice + deliveryFee).round()}",
            ),
          ],
        );
      },
    );
  }
}
