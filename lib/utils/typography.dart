import 'package:flutter/material.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/sizes.dart';

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
  static TextStyle headingH1 = TextStyle(
    fontFamily: familySpaceGrotesk,
    fontWeight: weightMedium,
    fontSize: Sizes.size_30,
  );

  static TextStyle headingH2 = TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightMedium,
    fontSize: Sizes.size_20,
  );


  //body large
  static TextStyle bodyLargeRegular = TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightRegular, // 400
    fontSize: Sizes.size_20,
  );

  //body large
  static TextStyle bodyLargeMedium = TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightMedium, // 400
    fontSize: Sizes.size_20,
  );

  //bodyMedium

  static TextStyle bodyMediumLight = TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightLight,
    fontSize: Sizes.size_16,
  );

  static TextStyle bodyMediumRegular = TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightRegular, // 400
    fontSize: Sizes.size_16,
  );

  static TextStyle bodyMediumMedium = TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightMedium, // 500
    fontSize: Sizes.size_16,
  );

  static TextStyle bodyMediumSemiBold =  TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightSemiBold, // 600
    fontSize: Sizes.size_16,
  );

  static TextStyle bodyMediumBold =  TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightBold,
    fontSize: Sizes.size_16,
  );

  //body small

  static TextStyle bodySmallSemiBold =  TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightSemiBold, // 600
    fontSize: Sizes.size_14,
  );

  static TextStyle bodySmallRegular = TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightRegular, // 400
    fontSize: Sizes.size_14,
  );

  static TextStyle bodySmallMedium = TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightMedium, //500
    fontSize: Sizes.size_14,
    // height: 1.6,
  );

  static TextStyle bodySmallLight = TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightLight,
    fontSize: Sizes.size_14,
    // height: 1.6,
  );

  //Body extra Small

  static TextStyle bodyExtraSmallSemiBold = TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightSemiBold, // 600
    fontSize: Sizes.size_12,
  );

  static TextStyle bodyExtraSmallRegular = TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightRegular, // 400
    fontSize: Sizes.size_12,
  );

  static TextStyle bodyExtraSmallMedium = TextStyle(
    fontFamily: familyUrbanist,
    fontWeight: weightMedium, // 500
    fontSize: Sizes.size_12,
  );
}
