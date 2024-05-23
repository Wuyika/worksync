/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAppIconsGen {
  const $AssetsAppIconsGen();

  /// File path: assets/app_icons/app_logo_dark.png
  AssetGenImage get appLogoDark =>
      const AssetGenImage('assets/app_icons/app_logo_dark.png');

  /// File path: assets/app_icons/app_logo_white.png
  AssetGenImage get appLogoWhite =>
      const AssetGenImage('assets/app_icons/app_logo_white.png');

  $AssetsAppIconsSvgGen get svg => const $AssetsAppIconsSvgGen();

  /// List of all assets
  List<AssetGenImage> get values => [appLogoDark, appLogoWhite];
}

class $AssetsAppImagesGen {
  const $AssetsAppImagesGen();

  /// File path: assets/app_images/hand_wave.png
  AssetGenImage get handWave =>
      const AssetGenImage('assets/app_images/hand_wave.png');

  /// File path: assets/app_images/onboardingImage1.png
  AssetGenImage get onboardingImage1 =>
      const AssetGenImage('assets/app_images/onboardingImage1.png');

  /// File path: assets/app_images/onboardingImage2.png
  AssetGenImage get onboardingImage2 =>
      const AssetGenImage('assets/app_images/onboardingImage2.png');

  /// File path: assets/app_images/onboardingImage3.png
  AssetGenImage get onboardingImage3 =>
      const AssetGenImage('assets/app_images/onboardingImage3.png');

  /// File path: assets/app_images/onboardingImage4.png
  AssetGenImage get onboardingImage4 =>
      const AssetGenImage('assets/app_images/onboardingImage4.png');

  /// File path: assets/app_images/onboardingImage5.png
  AssetGenImage get onboardingImage5 =>
      const AssetGenImage('assets/app_images/onboardingImage5.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        handWave,
        onboardingImage1,
        onboardingImage2,
        onboardingImage3,
        onboardingImage4,
        onboardingImage5
      ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en.json
  String get en => 'assets/translations/en.json';

  /// File path: assets/translations/fr.json
  String get fr => 'assets/translations/fr.json';

  /// List of all assets
  List<String> get values => [en, fr];
}

class $AssetsAppIconsSvgGen {
  const $AssetsAppIconsSvgGen();

  /// File path: assets/app_icons/svg/app_logo_dark.svg
  String get appLogoDark => 'assets/app_icons/svg/app_logo_dark.svg';

  /// File path: assets/app_icons/svg/app_logo_light.svg
  String get appLogoLight => 'assets/app_icons/svg/app_logo_light.svg';

  /// File path: assets/app_icons/svg/calendar-tick.svg
  String get calendarTick => 'assets/app_icons/svg/calendar-tick.svg';

  /// File path: assets/app_icons/svg/chart.svg
  String get chart => 'assets/app_icons/svg/chart.svg';

  /// File path: assets/app_icons/svg/dashboard.svg
  String get dashboard => 'assets/app_icons/svg/dashboard.svg';

  /// File path: assets/app_icons/svg/eye-slash.svg
  String get eyeSlash => 'assets/app_icons/svg/eye-slash.svg';

  /// File path: assets/app_icons/svg/eye.svg
  String get eye => 'assets/app_icons/svg/eye.svg';

  /// File path: assets/app_icons/svg/hand_wave.svg
  String get handWave => 'assets/app_icons/svg/hand_wave.svg';

  /// File path: assets/app_icons/svg/messages-2.svg
  String get messages2 => 'assets/app_icons/svg/messages-2.svg';

  /// File path: assets/app_icons/svg/note.svg
  String get note => 'assets/app_icons/svg/note.svg';

  /// File path: assets/app_icons/svg/notification.svg
  String get notification => 'assets/app_icons/svg/notification.svg';

  /// File path: assets/app_icons/svg/people.svg
  String get people => 'assets/app_icons/svg/people.svg';

  /// File path: assets/app_icons/svg/personalcard.svg
  String get personalcard => 'assets/app_icons/svg/personalcard.svg';

  /// File path: assets/app_icons/svg/svgTest.svg
  String get svgTest => 'assets/app_icons/svg/svgTest.svg';

  /// List of all assets
  List<String> get values => [
        appLogoDark,
        appLogoLight,
        calendarTick,
        chart,
        dashboard,
        eyeSlash,
        eye,
        handWave,
        messages2,
        note,
        notification,
        people,
        personalcard,
        svgTest
      ];
}

class Assets {
  Assets._();

  static const $AssetsAppIconsGen appIcons = $AssetsAppIconsGen();
  static const $AssetsAppImagesGen appImages = $AssetsAppImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
