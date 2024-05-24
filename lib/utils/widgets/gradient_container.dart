import 'package:flutter/material.dart';
import 'package:worklin/utils/colors.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(
      {super.key,
        required this.child,
        this.width,
        this.height,
        this.borderRadius});
  final Widget child;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: const LinearGradient(
            begin: Alignment(-0.5, -1.0),
            end: Alignment(1.5, 2.0),
            colors: [
             AppColors.secondary,
              Colors.purpleAccent,
              // Color(0xFF02234C)
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
