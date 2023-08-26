import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/cart/presentation/widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const TextWidget(
          text: "Cart",
          fontSize: 18,
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Transform.translate(
            offset: const Offset(20, 0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                color: Colors.white,
                elevation: 2,
                borderRadius: BorderRadius.circular(10),
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(children: [
        CartItemWidget(
          onShowDetails: () {},
          onDelete: () {},
        ),
      ]),
    );
  }
}
