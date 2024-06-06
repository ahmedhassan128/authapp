import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  // add for validate
  final onSaved;
  const CustomTextField({
    super.key,
    this.maxLines = 1,
    this.keyboardType,
    this.inputFormatters,
    required this.isPassword,
    required this.controller,
    this.validator,
    required this.hintText,
    required Null Function(dynamic value) Function,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: isPassword,
        validator: validator,
        controller: controller,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            fillColor: const Color(0xfff3f3f4),
            filled: true));
  }
}
