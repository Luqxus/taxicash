import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.prefix,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        prefix: prefix,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 20.0,
        ),
      ),
    );
  }
}
