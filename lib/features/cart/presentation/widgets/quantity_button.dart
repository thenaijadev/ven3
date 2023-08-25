import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';

class QuantityButton extends StatefulWidget {
  const QuantityButton({super.key, required this.isMinus, required this.onTap});
  final bool isMinus;
  final VoidCallback onTap;

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Material(
        elevation: widget.isMinus ? 0 : 4,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          decoration: BoxDecoration(
              color: widget.isMinus ? Colors.white : AppColors.orange,
              border: Border.all(
                width: 1,
                color: AppColors.orange,
              ),
              borderRadius: BorderRadius.circular(100)),
          height: 30,
          width: 30,
          child: Center(
              child: Icon(
            widget.isMinus ? Icons.remove : Icons.add,
            color: widget.isMinus ? AppColors.orange : Colors.white,
          )),
        ),
      ),
    );
  }
}
