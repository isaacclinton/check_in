import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
    this.hintText, {
    super.key,
    this.obscureText = false,
  });

  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: hintText,
        constraints: const BoxConstraints(),
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}
