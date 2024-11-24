import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
    final String? Function(String?)? validator;

  const CustomTextField({super.key, required this.label, required this.controller, required this.validator});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: validator,
        style: const TextStyle(
          color: Colors.white, // Change the text color here
          fontSize: 16, // Optional: Change the font size
        ),
        cursorColor: Colors.red,
        obscureText: label == "password",
        controller: controller,
        decoration: InputDecoration(
            labelStyle: const TextStyle(color: Colors.black),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            border: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red, width: BorderSide.strokeAlignOutside)),
            labelText: label)
    );
    
  }
}
