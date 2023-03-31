import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormFieldRewrite extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var controller;
  final String hintText;

  TextFormFieldRewrite(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLength: 15,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        cursorColor: Colors.blue,
        controller: controller,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            hintText: hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(22))),
      ),
    );
  }
}
