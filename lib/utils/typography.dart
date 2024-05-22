import 'package:flutter/material.dart';
import 'package:worklin/utils/colors.dart';

class AppTypography {
  AppTypography();

  //fonts
  static const String familyUrbanist = 'Urbanist';
  static const String familySpaceGrotesk = 'Space_Grotesk';

  //weights
  static const FontWeight weightThin = FontWeight.w100;
  static const FontWeight weightExtraLight = FontWeight.w200;
  static const FontWeight weightLight = FontWeight.w300;
  static const FontWeight weightRegular = FontWeight.w400;
  static const FontWeight weightMedium = FontWeight.w500;
  static const FontWeight weightSemiBold = FontWeight.w600;
  static const FontWeight weightBold = FontWeight.w700;

  // sizes
  static double sizeXXS = 8;
  static double sizeXS = 12;
  static double sizeSM = 20;
  static double sizeSL = 24;
  static double sizeMD = 32;
  static double sizeLG = 40;
  static double sizeXL = 48;
  static double sizeXXL = 54;
  static double sizeXXXL = 60;
  static double sizeXXXXL = 72;

  //text styles

  //headings
  static TextStyle headingH1 = const TextStyle(
    fontFamily: familySpaceGrotesk,
    fontWeight: weightMedium,
    fontSize: 30,
  );

  static TextStyle headingH2 = const TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightMedium,
    fontSize: 20,
  );


  //body large
  static TextStyle bodyLargeRegular = const TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightRegular, // 400
    fontSize: 20,
  );

  //bodyMedium

  static TextStyle bodyMediumRegular = const TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightRegular, // 400
    fontSize: 18,
  );

  static TextStyle bodyMediumMedium = const TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightMedium, // 500
    fontSize: 16,
  );

  static TextStyle bodyMediumSemiBold = const TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightSemiBold, // 600
    fontSize: 16,
  );

  static TextStyle bodyMediumBold = const TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightBold,
    fontSize: 16,
  );

  //body small

  static TextStyle bodySmallSemiBold = const TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightSemiBold, // 600
    fontSize: 14,
  );

  static TextStyle bodySmallRegular = const TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightRegular, // 400
    fontSize: 14,
  );

  static TextStyle bodySmallMedium = const TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightMedium, //500
    fontSize: 14,
    // height: 1.6,
  );

  //Body extra Small

  static TextStyle bodyExtraSmallRegular = const TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightRegular, // 400
    fontSize: 12,
  );

  static TextStyle bodyExtraSmallMedium = const TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightMedium, // 500
    fontSize: 12,
  );
}
