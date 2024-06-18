import 'package:flutter/material.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/sizes.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.size_2),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        spacing: Sizes.size_2,
        children: [
          Icon(
            Icons.circle,
            color: color,
            size: 12,
          ),
          // SizedBox(width: Sizes.size_2),
          Text(
            text,
            style: AppTypography.bodyExtraSmallRegular.copyWith(
              fontSize: Sizes.size_10,
            ),
          ),
          // SizedBox(width: Sizes.size_2),
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
