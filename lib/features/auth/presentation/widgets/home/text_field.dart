import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget(
      {super.key,
      required this.label,
      // this.hintColor = AppColors.hintColor,
      this.initialValue,
      required this.hintText,
      this.hintSize = 14,
      this.keyboardType = TextInputType.text,
      required this.onChanged,
      this.validator,
      required this.textFieldkey,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixicon,
      this.padding = const EdgeInsets.only(bottom: 10),
      this.onTap,
      this.maxLines = 1,
      this.fontWeight = FontWeight.w600,
      this.labelFontSize = 16,
      this.enabledBorderRadius = 30,
      this.verticalContentPadding = 0,
      this.controller});
  final String label;
  final String hintText;
  final double hintSize;
  final void Function(String?) onChanged;
  final void Function()? onTap;

  final String? Function(String?)? validator;
  final GlobalKey<FormFieldState> textFieldkey;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixicon;
  final String? initialValue;
  final EdgeInsetsGeometry padding;
  final int? maxLines;
  final double enabledBorderRadius;
  final double verticalContentPadding;
  final FontWeight fontWeight;
  // final Color hintColor;
  final double labelFontSize;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: padding,
          child: TextWidget(
            text: label,
            color: const Color(0xFF9796A1),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          onTap: onTap,
          key: textFieldkey,
          initialValue: initialValue,
          onChanged: onChanged,
          maxLines: maxLines,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIconColor: AppColors.orange,
            prefixIcon: prefixicon,
            suffixIcon: suffixIcon,
            hintStyle: TextStyle(
                color: const Color(0xFFC4C4C4),
                fontSize: hintSize,
                fontFamily: 'Neue Plak'),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 255, 0, 0),
                width: .5,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 255, 0, 0),
                width: .5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.orange,
                width: .5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 0.50, color: AppColors.inputGrey),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
          ),
        ),
      ]),
    );
  }
}
