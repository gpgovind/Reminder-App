import 'package:flutter/material.dart';

class BlurryContainer extends StatelessWidget {
  final double? blur;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final Widget? child;
  final double elevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const BlurryContainer(
      {this.blur,
      this.borderRadius,
      this.child,
      this.padding,
      this.color,
      this.margin,
      this.elevation = 0.0,
      this.height,
      this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(borderRadius: borderRadius, color: color),
      child: child,
    );
  }
}
