import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/background_widget.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BackgroundWidget(
            image: "assets/images/sign_up_background.png",
          ),
        ],
      ),
    );
  }
}

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
    );
  }
}
