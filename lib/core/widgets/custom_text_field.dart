import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.validator,
  }) : super(key: key);
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String? val) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      style: const TextStyle(fontSize: 18),
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff1A2035)),
            borderRadius: BorderRadius.all(
              Radius.circular(109),
            )),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff1A2035)),
          borderRadius: BorderRadius.all(Radius.circular(109)),
        ),
        filled: true,
        fillColor: const Color(0xff1A2035),
      ),
    );
  }
}
