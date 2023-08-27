import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/cart/presentation/widgets/quantity_row.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key,
      required this.price,
      required this.quantity,
      required this.image,
      required this.name});
  final int price;
  final int quantity;
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Card(
        shadowColor: AppColors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SizedBox(
                  width: 230,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 99,
                            child: TextWidget(
                              overflow: TextOverflow.ellipsis,
                              text: name,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextWidget(
                            text: "₦$price",
                            fontSize: 14,
                            color: AppColors.orange,
                          ),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      QuantityRow(
                          onReduce: () {},
                          onIncrease: () {},
                          quantity: quantity)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
