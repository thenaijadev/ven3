import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/home/presentation/widgets/primary_button.dart';

class FoodPageView extends StatefulWidget {
  const FoodPageView({super.key});

  @override
  State<FoodPageView> createState() => _FoodPageViewState();
}

late Image image1;
late Image image2;
late Image image3;

class _FoodPageViewState extends State<FoodPageView> {
  @override
  void initState() {
    image1 = Image.asset("assets/images/swallow.jpg");
    image2 = Image.asset("assets/images/rice.jpg");
    image3 = Image.asset("assets/images/pasta.jpg");

    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
    precacheImage(image3.image, context);

    super.didChangeDependencies();
  }

  List<String> images = [
    "assets/images/swallow.jpg",
    "assets/images/rice.jpg",
    "assets/images/pasta.jpg"
  ];
  List<String> foods = ["Swallow", "Rice", "Pasta"];
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
                  images[currentIndex],
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
            itemCount: images.length,
            itemBuilder: (context, index) {
              return FractionallySizedBox(
                widthFactor: 0.8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        images[index],
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
                  text: foods[currentIndex],
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: AppColors.orange,
                ),
              ],
            )),
        Positioned(bottom: 90, child: PrimaryButton(onTap: () {}))
      ],
    );
  }
}
