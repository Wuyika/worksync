import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:worklin/pages/auth/signin/view/signin_page.dart';
import 'package:worklin/pages/onboarding/onboarding_page.dart';
import 'package:worklin/utils/globals.dart';
import 'package:worklin/utils/my_pref.dart';
import 'package:worklin/utils/sizes.dart';
import 'package:worklin/utils/theme.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();
  await GetStorage.init().then((value) => FlutterNativeSplash.remove());
  final String savedLocale = MyPref.getLocaleCode();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
      ],
      path: 'assets/translations',
      fallbackLocale: Locale(savedLocale),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    rebuildAllChildren(context);
    Sizes.init(context);
    return MaterialApp(
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: snackbarKey,
      title: 'Worklink',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      home: MyPref.hasOnboardingBeenShown()
          ? const SignInPage()
          : const OnboardingPage(),
    );
  }
}

// dart run easy_localization:generate -S "assets/translations/" -O "lib/gen/translations" - o "codegen_loader.g.dart" -f keys
