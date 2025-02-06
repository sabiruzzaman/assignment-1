import 'package:flutter/material.dart';

class PasswordInputFieldWidget extends StatefulWidget {
  final String? label;
  final String? hintText;
  final IconData? icon;
  final TextInputType type;

  const PasswordInputFieldWidget({
    super.key,
    required this.label,
     this.hintText,
     this.icon,
    required this.type,
  });

  @override
  State<PasswordInputFieldWidget> createState() =>
      _PasswordInputFieldWidgetState();
}

class _PasswordInputFieldWidgetState extends State<PasswordInputFieldWidget> {
  bool _obscurePassword = true;

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
          keyboardType: widget.type,
          obscureText: widget.type == TextInputType.visiblePassword
              ? _obscurePassword
              : false,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: const TextStyle(color: Colors.grey),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.white),
            filled: true,
            fillColor: Colors.transparent,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            suffixIcon: widget.type == TextInputType.visiblePassword
                ? IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  )
                : Icon(widget.icon, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
