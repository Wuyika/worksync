import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/globals.dart';
import 'package:worklin/utils/my_pref.dart';
import 'package:worklin/utils/sizes.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/appbar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: Text(
          LocaleKeys.settings.tr(),
          style: AppTypography.headingH2,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Sizes.size_16, vertical: 20),
        child: Column(
          children: [
            ListTile(
              onTap: () => _showLanguageSelectionBottomSheet(context),
              // tileColor: AppColors.white,
              contentPadding: EdgeInsets.zero,
              title: Text(
                _getLanguageFromCode(context.locale),
                style: AppTypography.bodyMediumMedium.copyWith(
                  color: AppColors.primary,
                ),
              ),
              trailing: SvgPicture.asset(Assets.appIcons.svg.arrowDown),
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageSelectionBottomSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: CupertinoActionSheet(
            title: Text(LocaleKeys.select_language.tr()),
            actions: List.generate(
              languages.length,
              (index) => CupertinoActionSheetAction(
                onPressed: () {
                  _updateLanguage(context, languages.elementAt(index));
                  Navigator.pop(context);
                },
                child: Text(
                  _getLanguageFromCode(languages.elementAt(index)),
                  style: AppTypography.bodyMediumMedium.copyWith(
                    color: languages.elementAt(index).languageCode ==
                        context.locale.languageCode
                        ? AppColors.secondary
                        : AppColors.primary,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _updateLanguage(BuildContext context, Locale locale) {
    MyPref.saveLocaleCode(locale: locale.languageCode);
    context.setLocale(locale);
  }

  String _getLanguageFromCode(Locale locale) {
    switch (locale.languageCode) {
      case "en":
        return LocaleKeys.english.tr();
      case "fr":
        return LocaleKeys.french.tr();
      default:
        return locale.languageCode;
    }
  }
}
