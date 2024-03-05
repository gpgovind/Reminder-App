import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;

  const CustomTextField(
      {super.key,
      required this.hintText,
      this.keyboardType,
      this.obscureText = false,
      this.validator,
      required this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          controller: widget.controller,
          decoration: InputDecoration(
            focusColor: Colors.green,
            labelText: widget.hintText,

            prefixIcon: const Icon(
              Icons.medical_information,
              color: Colors.green,
            ),
            contentPadding: EdgeInsets.symmetric(
                vertical: 13.sp, horizontal: 15), // Adjust padding
            isDense: true, // Reduce vertical height
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
