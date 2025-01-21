import 'package:crud_opration/core/constants/color_manger.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.keyboardType,
      required this.hintText,
      this.maxLength,
      this.validator});
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final TextInputType keyboardType;
  final String hintText;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      maxLength: maxLength,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        border: outLineInPutBorder(),
        enabledBorder: outLineInPutBorder(),
        focusedBorder: outLineInPutBorder(),
      ),
    );
  }

  OutlineInputBorder outLineInPutBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: ColorManger.kGlodenColor),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
