import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/enums.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/button.dart';

class DialogCardWidget extends StatelessWidget {
  final DialogType dialogType;
  final String titleText;
  final String actionText;
  final String? descriptionText;
  final String? warningText;

  const DialogCardWidget({
    super.key,
    required this.dialogType,
    required this.titleText,
    required this.actionText,
    this.descriptionText,
    this.warningText,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                dialogType == DialogType.success
                    ? Assets.appIcons.svg.succeessAnimation
                    : Assets.appIcons.svg.dangerAnimation,
              ),
              const SizedBox(height: 16),
              Text(
                titleText,
                textAlign: TextAlign.center,
                style: AppTypography.bodyLargeMedium.copyWith(
                  fontFamily: AppTypography.familySpaceGrotesk,
                ),
              ),
              const SizedBox(height: 12),
              if (descriptionText != null)
                Column(
                  children: [
                    Text(
                      descriptionText!,
                      textAlign: TextAlign.center,
                      style: AppTypography.bodySmallMedium.copyWith(
                        color: AppColors.textColor.withOpacity(0.9),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              if (dialogType == DialogType.failure)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        onPress: () {
                          AppNavigator.pop(context);
                        },
                        buttonText: warningText ?? "Cancel",
                        showIcon: false,
                        backgroundButtonColor: AppColors.warning,
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: PrimaryButton(
                        onPress: () {
                          AppNavigator.pop(context, true);
                        },
                        buttonText: actionText,
                        showIcon: false,
                      ),
                    ),
                  ],
                )
              else
                PrimaryButton(
                  onPress: () {
                    AppNavigator.pop(context, true);
                  },
                  buttonText: actionText,
                  showIcon: false,
                ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
