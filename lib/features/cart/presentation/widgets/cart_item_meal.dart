import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';

class CartItemMeal extends StatefulWidget {
  const CartItemMeal(
      {super.key,
      required this.onShowDetails,
      required this.onDelete,
      required this.showDetailsIcon,
      required this.name,
      required this.image,
      required this.amount,
      required this.price});
  final VoidCallback onShowDetails;
  final VoidCallback onDelete;
  final IconData showDetailsIcon;
  final String name;
  final double price;
  final String image;
  final String amount;

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
                    image: DecorationImage(
                        image: NetworkImage(widget.image), fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0.0, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 185,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: TextWidget(
                                text: widget.name,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
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
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Row(
                            children: [
                              TextWidget(
                                text: "₦${widget.price} x ${widget.amount}",
                                color: AppColors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
