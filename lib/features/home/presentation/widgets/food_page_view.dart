import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/food_types/data/models/food.dart';
import 'package:the_food_hub_nsk_nig/features/home/presentation/widgets/primary_button.dart';

class FoodPageView extends StatefulWidget {
  const FoodPageView(
      {super.key, required this.category, required this.navigate});
  final List<Food> category;
  final void Function(Food) navigate;
  @override
  State<FoodPageView> createState() => _FoodPageViewState();
}

class _FoodPageViewState extends State<FoodPageView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          child: Container(
            key: ValueKey<int>(currentIndex),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  widget.category[currentIndex].image,
                ),
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
        ),
        FractionallySizedBox(
          heightFactor: 0.55,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemCount: widget.category.length,
            itemBuilder: (context, index) {
              return FractionallySizedBox(
                widthFactor: 0.8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        widget.category[index].image,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
            top: 70,
            child: Column(
              children: [
                const TextWidget(
                  text: "I'm hungry for",
                  fontSize: 22,
                  color: Colors.white,
                ),
                TextWidget(
                  text: widget.category[currentIndex].name,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.orange,
                ),
              ],
            )),
        Positioned(
            bottom: 90,
            child: PrimaryButton(onTap: () {
              widget.navigate(widget.category[currentIndex]);
            }))
      ],
    );
  }
}
