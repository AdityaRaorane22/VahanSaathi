import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String label;
  final bool obscureText;

  const TextInputField({super.key, required this.label, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}