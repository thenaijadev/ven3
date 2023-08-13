import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/background_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/home_content_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/overlay_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [BackgroundWidget(), OverLayWidget(), HomeContentWidget()],
      ),
    );
  }
}
