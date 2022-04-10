import 'package:fitden_homeworkout/constants/consts.dart';
import 'package:flutter/material.dart';

class MyInputField extends StatelessWidget {
  const MyInputField({
    required this.hintText,
    required this.controller,
    required this.validator,
    Key? key,
  }) : super(key: key);
  final String hintText;
  final TextEditingController controller;
  final String Function(String? val) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        border: const OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(defaultBorderRadius)),
            borderSide: BorderSide(width: 1, color: Colors.white)),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.black)),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.red)),
        filled: true,
        hintStyle: const TextStyle(color: Colors.grey),
        //   labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        hintText: hintText,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}