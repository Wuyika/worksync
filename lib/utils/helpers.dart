import 'package:flutter/material.dart';

void hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

// Custom Gradient Text Widget
class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText({
    required this.text,
    required this.gradient,
    this.style = const TextStyle(fontSize: 40),
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style.copyWith(color: Colors.white), // Temporary color for the shader
      ),
    );
  }
}
