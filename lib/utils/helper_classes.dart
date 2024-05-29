import 'package:flutter/material.dart';
import 'package:worklin/utils/helpers.dart';

class CustomDateTimeController {
  TextEditingController textController;
  DateTime? dateTimeValue;
  String? Function(String?)? validator;

  CustomDateTimeController({
    this.dateTimeValue,
    this.validator,
  }) : textController = TextEditingController(
          text: dateTimeValue != null ? dateFormat.format(dateTimeValue) : null,
        );

  void setDateTime(DateTime? newDateTime) {
    dateTimeValue = newDateTime;
    textController.text =
        newDateTime != null ? dateFormat.format(newDateTime) : '';
  }

  DateTime? getDateTime() {
    return dateTimeValue;
  }

  void clear() {
    dateTimeValue = null;
    textController.clear();
  }

  void dispose() {
    textController.dispose();
  }
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
        style: style.copyWith(
          color: Colors.white,
        ), // Temporary color for the shader
      ),
    );
  }
}
