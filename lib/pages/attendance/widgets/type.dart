import 'package:flutter/material.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';

class TypeWidget extends StatelessWidget {
  final String text;
  final int value;
  final Color color;

  const TypeWidget({
    super.key,
    required this.text,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.circle,
            color: color,
            size: 12,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              text,
              style: AppTypography.bodyExtraSmallRegular,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            "$value%",
            style: AppTypography.bodyExtraSmallSemiBold.copyWith(
              color: AppColors.textColor.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
