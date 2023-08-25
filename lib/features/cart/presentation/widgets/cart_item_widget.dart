import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/cart/presentation/widgets/quantity_button.dart';

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
          padding: const EdgeInsets.all(10.0),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 210,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextWidget(
                          text: "Rice Meal",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        Icon(
                          Icons.delete,
                          color: AppColors.orange,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          const TextWidget(
                            text: "\$15.30",
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                          QuantityButton(
                            onTap: () {},
                            isMinus: true,
                          ),
                          QuantityButton(
                            onTap: () {},
                            isMinus: false,
                          )
                        ],
                      )),
                  const Padding(
                    padding: EdgeInsets.only(left: 27.0),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 100,
                            child: TextWidget(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 14,
                              text: "Coconut rice, Fried Chiken, Coke,",
                              color: AppColors.detailsGrey,
                            )),
                        Icon(Icons.keyboard_arrow_down_rounded)
                      ],
                    ),
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
