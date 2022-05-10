import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final int? maxlines;
  final TextEditingController? controller;
  bool? obscureText;

  CustomTextField(
      {this.obscureText, this.controller, this.label, this.maxlines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field cannot be empty';
        }
        return null;
      },
      maxLines: maxlines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusColor: Colors.white,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white, width: 1)),
      ),
    );
  }
}
