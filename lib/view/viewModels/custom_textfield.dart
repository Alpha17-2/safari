import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final int? maxlines;
  final TextEditingController? controller;
  bool? obscureText;
  Color? borderColor;
  Color? textColor;

  CustomTextField(
      {this.obscureText,
      this.borderColor,
      this.controller,
      this.label,
      this.textColor,
      this.maxlines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field cannot be empty';
        }
        return null;
      },
      maxLines: maxlines,
      style:  TextStyle(color: textColor),
      decoration: InputDecoration(
        focusColor: textColor,
        labelText: label,
        labelStyle: TextStyle(color:textColor),
        fillColor: textColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: borderColor ?? Colors.black)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: borderColor! , width: 1)),
      ),
    );
  }
}
