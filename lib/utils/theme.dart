import 'package:flutter/material.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      background: AppColors.backGroundColor,
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: AppTypography.familyUrbanist,
        fontWeight: FontWeight.w700,
        fontSize: AppTypography.sizeXXL,
        color: AppColors.textColor,
      ),
      displayMedium: TextStyle(
        fontFamily: AppTypography.familyUrbanist,
        fontWeight: FontWeight.w900,
        fontSize: AppTypography.sizeXL,
        color: AppColors.textColor,
      ),
      displaySmall: TextStyle(
        fontFamily: AppTypography.familyUrbanist,
        fontWeight: FontWeight.w400,
        fontSize: AppTypography.sizeLG,
        color: AppColors.textColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: AppTypography.familyUrbanist,
        fontWeight: FontWeight.w400,
        fontSize: AppTypography.sizeMD,
        color: AppColors.primary,
      ),
      headlineSmall: TextStyle(
        fontFamily: AppTypography.familyUrbanist,
        fontWeight: FontWeight.w400,
        fontSize: AppTypography.sizeSL,
        color: AppColors.primary,
      ),
      titleLarge: TextStyle(
        fontFamily: AppTypography.familyUrbanist,
        fontWeight: FontWeight.w400,
        fontSize: AppTypography.sizeSM,
        color: AppColors.primary,
      ),
    ),
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    useMaterial3: true,
  );
}
