import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/header_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/signin_options.dart';

class HomeContentWidget extends StatelessWidget {
  const HomeContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [HeaderWidget(), SignInOptions()],
        ),
      ),
    );
  }
}
