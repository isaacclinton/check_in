import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
    this.text, {
    super.key,
    required this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
        backgroundColor: const Color(0xFF2F66F3),
      ),
      child: Text(text),
    );
  }
}