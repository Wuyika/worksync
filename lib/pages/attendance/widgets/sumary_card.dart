import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/sizes.dart';
import 'package:worklin/utils/typography.dart';

class SummaryCard extends StatelessWidget {
  final Color color;
  final int value;
  final String title;
  const SummaryCard({super.key, required this.color, required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: Sizes.size_20),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: color,
            width: 4,
          ),
          right: BorderSide(
              color: AppColors.textColor.withOpacity(0.2),
              width: 0.8,
          ),
          bottom: BorderSide(
            color: AppColors.textColor.withOpacity(0.2),
            width: 0.8,
          ),
          top: BorderSide(
            color: AppColors.textColor.withOpacity(0.2),
            width: 0.8,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$value%",
            style: AppTypography.bodyLargeMedium.copyWith(
              fontFamily: AppTypography.familySpaceGrotesk,
              fontSize: Sizes.size_24,
            ),
          ),
          Text(
            title,
            style: AppTypography.bodyExtraSmallRegular.copyWith(
              color: AppColors.textColor.withOpacity(0.7),
              fontWeight: AppTypography.weightLight,
            ),
          ),
        ],
      ),
    );
  }
}
