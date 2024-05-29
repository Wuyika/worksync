import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/main_page/view/main_page.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/helpers.dart';
import 'package:worklin/utils/sizes.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/appbar.dart';
import 'package:worklin/utils/widgets/button.dart';
import 'package:worklin/utils/widgets/custom_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();
  PageController pageController = PageController();
  int currentStep = 0;

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: AppTypography.bodyLargeRegular.copyWith(
      fontFamily: AppTypography.familySpaceGrotesk,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.inactive),
      borderRadius: BorderRadius.circular(6),
    ),
  );

  void slideToNextPage() {
    pageController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        centerTitle: true,
        title: Text(
          currentStep == 0
              ? LocaleKeys.forgot_password.tr()
              : currentStep == 1
                  ? LocaleKeys.verify_email.tr()
                  : LocaleKeys.reset_password.tr(),
          style: AppTypography.headingH2,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  currentStep = index;
                });
              },
              controller: pageController,
              children: [
                forgotPassword,
                verifyEmail,
                resetPassword,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get forgotPassword {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.forgot_description.tr(),
            style: AppTypography.bodyLargeRegular.copyWith(
              fontFamily: AppTypography.familySpaceGrotesk,
              fontSize: Sizes.size_18,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            LocaleKeys.work_email.tr(),
            style: AppTypography.bodySmallRegular.copyWith(
              color: AppColors.textColor,
            ),
          ),
          const SizedBox(height: 4),
          CustomTextField(
            hintText: LocaleKeys.email_hint.tr(),
            controller: emailController,
          ),
          const SizedBox(height: 60),
          PrimaryButton(
            onPress: () {
              slideToNextPage();
            },
            buttonText: LocaleKeys.continue_t.tr(),
          ),
        ],
      ),
    );
  }

  Widget get verifyEmail {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.verify_description.tr(),
            style: AppTypography.bodyLargeRegular.copyWith(
              fontFamily: AppTypography.familySpaceGrotesk,
              fontSize: Sizes.size_18,
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Pinput(
              length: 5,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyDecorationWith(
                border: Border.all(color: AppColors.secondary),
              ),
              submittedPinTheme: defaultPinTheme.copyDecorationWith(
                border: Border.all(color: AppColors.secondary),
              ),
            ),
          ),
          const SizedBox(height: 60),
          PrimaryButton(
            onPress: () {
              slideToNextPage();
            },
            buttonText: LocaleKeys.verify.tr(),
          ),
        ],
      ),
    );
  }

  Widget get resetPassword {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.reset_description.tr(),
            style: AppTypography.bodyLargeRegular.copyWith(
              fontFamily: AppTypography.familySpaceGrotesk,
              fontSize: Sizes.size_18,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            LocaleKeys.new_password.tr(),
            style: AppTypography.bodySmallRegular.copyWith(
              color: AppColors.textColor,
            ),
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: LocaleKeys.password_hint.tr(),
            controller: emailController,
            isPassword: true,
          ),
          const SizedBox(height: 30),
          Text(
            LocaleKeys.confirm_password.tr(),
            style: AppTypography.bodySmallRegular.copyWith(
              color: AppColors.textColor,
            ),
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: LocaleKeys.password_hint.tr(),
            controller: emailController,
            isPassword: true,
          ),
          const SizedBox(height: 60),
          PrimaryButton(
            onPress: () async {
              await showDialogCard(
                context,
                titleText: "New Password Created",
                actionText: "Log In",
                descriptionText: "Your new password has been created successfully",
              ).then((value) => AppNavigator.pop(context));
            },
            buttonText: LocaleKeys.confirm.tr(),
          ),
        ],
      ),
    );
  }
}
