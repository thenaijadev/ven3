import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/payment/presentation/widgets/new_card_form.dart';

class AddNewCardScreen extends StatelessWidget {
  const AddNewCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const TextWidget(
          text: "Add New Card",
          color: Colors.white,
          fontSize: 18,
        ),
        elevation: 0,
        backgroundColor: AppColors.orange,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Transform.translate(
            offset: const Offset(20, 0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                color: AppColors.orange,
                elevation: 2,
                borderRadius: BorderRadius.circular(10),
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColors.orange),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .7,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const AddNewCardForm(),
          ),
          Positioned(
              top: 30,
              child: Container(
                height: 250,
                width: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/card.png"),
                      fit: BoxFit.fitWidth),
                ),
              ))
        ],
      ),
    );
  }
}
