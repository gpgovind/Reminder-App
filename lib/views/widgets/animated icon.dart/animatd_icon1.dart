import 'package:flutter/material.dart';
import 'package:animated_icon_button/animated_icon_button.dart';

class AnimatedIcon1 extends StatelessWidget {
  const AnimatedIcon1({
    required Key key,
    required this.icon1,
    required this.icon2,
    required this.onPressed,
  }) : super(key: key);

  final Icon icon1;
  final Icon icon2;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedIconButton(
        size: 30,
        onPressed: onPressed,
        duration: const Duration(seconds: 1),
        splashColor: Colors.transparent,
        icons: <AnimatedIconItem>[
          AnimatedIconItem(
            icon: icon1,
        ),
          AnimatedIconItem(
            icon: icon2,
            
          ),
        ],
      ),
    );
  }
}
