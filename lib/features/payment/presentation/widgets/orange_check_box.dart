import 'package:flutter/material.dart';

class OrangeCheckbox extends StatefulWidget {
  const OrangeCheckbox(
      {super.key, required this.isChecked, required this.onTap});
  final bool isChecked;
  final VoidCallback onTap;
  @override
  _OrangeCheckboxState createState() => _OrangeCheckboxState();
}

class _OrangeCheckboxState extends State<OrangeCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.isChecked ? Colors.orange : Colors.transparent,
              border: Border.all(color: Colors.orange),
            ),
            child: widget.isChecked
                ? const Icon(
                    Icons.check,
                    size: 15,
                    color: Colors.white,
                  )
                : null,
          ),
          const SizedBox(width: 10),
          const Text(
            'Save payment method',
            style: TextStyle(fontSize: 16, color: Color(0xFF9796A1)),
          ),
        ],
      ),
    );
  }
}
