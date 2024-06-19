import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';

class ActionWidget extends StatelessWidget {
  final Color backGroundColor;
  final String iconPath;
  final String text;
  final VoidCallback? onTap;

  const ActionWidget({
    super.key,
    required this.backGroundColor,
    required this.iconPath,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Split the text into two parts based on the space
    final splitText = text.split(' ');
    final firstWord = splitText[0];
    final secondWord = splitText.length > 1 ? splitText[1] : '';
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: backGroundColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: AppTypography.bodyExtraSmallMedium.copyWith(
              color: AppColors.textColor,
            ),
            children: [
              TextSpan(text: text),
              // const TextSpan(text: '\n'), // Newline character to split the text
              // TextSpan(text: secondWord),
            ],
          ),
        ),
      ],
    );
  }
}
