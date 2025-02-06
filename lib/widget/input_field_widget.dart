import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({
    super.key,
    required this.label,
    this.hintText,
    this.icon,
    this.type = TextInputType.text,
  });

  final String? label;
  final String? hintText;
  final IconData? icon;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: TextField(
          keyboardType: type,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.grey),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white),
            filled: true,
            fillColor: Colors.transparent,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            suffixIcon: Icon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
