import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';

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
        leading: Transform.translate(
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
      body: ListView(children: const [CartItemWidget()]),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        shadowColor: AppColors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/swallow.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(text: "Rice Meal"),
                      Icon(
                        Icons.delete,
                        color: AppColors.orange,
                        size: 18,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
