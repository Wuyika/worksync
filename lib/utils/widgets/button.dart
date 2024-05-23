import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.isLoading = false,
    required this.onPress,
    required this.buttonText,
    this.showIcon = true,
    this.backgroundButtonColor,
    this.buttonTextColor,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.buttonTextPadding,
  });

  final String buttonText;
  final bool isLoading;
  final void Function()? onPress;
  final bool showIcon;
  final MainAxisAlignment mainAxisAlignment;
  final Color? backgroundButtonColor;
  final Color? buttonTextColor;
  final double? buttonTextPadding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: onPress != null && (!isLoading)
            ? backgroundButtonColor ?? AppColors.secondary
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      onPressed: isLoading ? null : onPress,
      child: isLoading
          ? const Center(
        heightFactor: 1,
        child: SizedBox(
          width: 20,
          height: 20,
          child:
          Center(child: CircularProgressIndicator.adaptive()),
        ),
      )
          : showIcon == false
          ? Center(
        heightFactor: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: buttonTextPadding ?? 16,
          ),
          child: Text(
            buttonText,
            style: AppTypography.bodyMediumMedium.copyWith(
              color: buttonTextColor ?? AppColors.white,
            ),
          ),
        ),
      )
          : Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Text(
              buttonText,
              style: AppTypography.bodyMediumMedium.copyWith(
                color: buttonTextColor ?? AppColors.white,
              ),
            ),
            const SizedBox(width: 12),
            SvgPicture.asset(
              Assets.appIcons.svg.lineArrowRight,
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}