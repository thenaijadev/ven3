import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/cart/presentation/widgets/quantity_row.dart';

class CartItemMeal extends StatefulWidget {
  const CartItemMeal(
      {super.key,
      required this.onShowDetails,
      required this.onDelete,
      required this.showDetailsIcon});
  final VoidCallback onShowDetails;
  final VoidCallback onDelete;
  final IconData showDetailsIcon;

  @override
  State<CartItemMeal> createState() => _CartItemMealState();
}

class _CartItemMealState extends State<CartItemMeal> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom: 10),
      child: GestureDetector(
        onTap: widget.onShowDetails,
        child: Card(
          shadowColor: AppColors.orange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                    SizedBox(
                      width: 210,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: TextWidget(
                              text: "Rice Meal",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: widget.onDelete,
                            child: const Icon(
                              Icons.delete,
                              color: AppColors.orange,
                              size: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(
                            left: 25, top: 15, bottom: 15),
                        child: Row(
                          children: [
                            const TextWidget(
                              text: "\$15.30",
                              color: AppColors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            QuantityRow(
                                onIncrease: () {}, onReduce: () {}, quantity: 4)
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 27.0),
                      child: Row(
                        children: [
                          const SizedBox(
                              width: 100,
                              child: TextWidget(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 14,
                                text: "Coconut rice, Fried Chiken, Coke,",
                                color: AppColors.detailsGrey,
                              )),
                          Icon(widget.showDetailsIcon)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
