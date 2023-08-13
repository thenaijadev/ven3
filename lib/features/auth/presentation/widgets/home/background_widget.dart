import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget(
      {super.key, this.image = "assets/images/home_background.png"});
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image!), fit: BoxFit.cover),
      ),
    );
  }
}
