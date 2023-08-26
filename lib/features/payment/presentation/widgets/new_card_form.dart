import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/auth_button.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/text_field.dart';
import 'package:the_food_hub_nsk_nig/features/payment/presentation/widgets/orange_check_box.dart';

class AddNewCardForm extends StatefulWidget {
  const AddNewCardForm({super.key});

  @override
  State<AddNewCardForm> createState() => _AddNewCardFormState();
}

class _AddNewCardFormState extends State<AddNewCardForm> {
  final GlobalKey<FormFieldState> key_1 = GlobalKey<FormFieldState>();

  final GlobalKey<FormFieldState> key_2 = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> key_3 = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> key_4 = GlobalKey<FormFieldState>();
  bool isChecked = false;

  void _toggleCheckbox(bool value) {
    setState(() {
      isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          InputFieldWidget(
              label: "Card Number",
              hintText: "1234 5678 9011 1213",
              onChanged: (val) {},
              textFieldkey: key_1),
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: InputFieldWidget(
                      label: "Expiry date",
                      hintText: "10/23",
                      onChanged: (val) {},
                      textFieldkey: key_2),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: InputFieldWidget(
                      label: "CVV",
                      hintText: "123",
                      onChanged: (val) {},
                      textFieldkey: key_3),
                ),
              ),
            ],
          ),
          InputFieldWidget(
              label: "Card Number",
              hintText: "1234 5678 9011 1213",
              onChanged: (val) {},
              textFieldkey: key_4),
          OrangeCheckbox(
            onTap: () {
              _toggleCheckbox(!isChecked);
            },
            isChecked: isChecked,
          ),
          PrimaryOrangeButton(onTap: () {}, label: "Add Card")
        ]),
      ),
    );
  }
}
