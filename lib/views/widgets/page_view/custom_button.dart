import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final void Function()? onTap;
  const CustomButton({super.key, required this.buttonName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.blue[400], borderRadius: BorderRadius.circular(18)),
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(
                fontSize: 17, color: Colors.white,
                 fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
