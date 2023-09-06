import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/app_bar_back_button.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/text_field.dart';

class PhoneNumberForm extends StatefulWidget {
  const PhoneNumberForm({super.key});

  @override
  State<PhoneNumberForm> createState() => _PhoneNumberFormState();
}

class _PhoneNumberFormState extends State<PhoneNumberForm> {
  final GlobalKey<FormFieldState> inputKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 30, right: 30),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarBackButton(onTap: () {}),
            const SizedBox(
              height: 100,
            ),
            const TextWidget(
              text: "Registration",
              fontWeight: FontWeight.bold,
              fontSize: 38,
            ),
            const SizedBox(
              height: 20,
            ),
            const TextWidget(
              text: "Enter your phone number to verify your account",
              color: Color(0xFF9796A1),
              fontSize: 14,
            ),
            InputFieldWidget(
                prefixicon: GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10),
                    child: TextWidget(
                      text: "🇳🇬",
                      fontSize: 40,
                    ),
                  ),
                ),
                label: "",
                hintText: "Phone number",
                onChanged: (val) {},
                textFieldkey: inputKey)
          ],
        ),
      ),
    );
  }
}
