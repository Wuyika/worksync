import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/auth/signin/view/signin_page.dart';
import 'package:worklin/pages/onboarding/faces_widget.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                child: const FacesWidget(),
              ),
              const Spacer(),
              Text(
                LocaleKeys.onboard_title.tr(),
                style: AppTypography.headingH1.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                LocaleKeys.onboard_description.tr(),
                style: AppTypography.bodyMediumRegular,
              ),
              const Spacer(),
              PrimaryButton(
                onPress: () {
                  AppNavigator.pushReplacement(context, const SignInPage());
                },
                buttonText: LocaleKeys.get_started.tr(),
                icon: const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
