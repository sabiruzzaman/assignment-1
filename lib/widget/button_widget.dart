import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onTap;

  const ButtonWidget(
      {super.key,
      required this.color,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 18),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
