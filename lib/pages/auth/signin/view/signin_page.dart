import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/auth/forgotpassword/view/forgot_password_page.dart';
import 'package:worklin/pages/main_page/view/main_page.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/helper_classes.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/button.dart';
import 'package:worklin/utils/widgets/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              Align(
                child: SvgPicture.asset(
                  Assets.appIcons.svg.appLogoDark,
                  height: 56,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(Assets.appImages.handWave.path),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GradientText(
                      text: LocaleKeys.login_access.tr(),
                      style: AppTypography.bodyLargeRegular,
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.secondary, // Your provided color code
                          Colors.purple, // Generic purple color
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
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
              const SizedBox(height: 28),
              Text(
                LocaleKeys.password.tr(),
                style: AppTypography.bodySmallRegular.copyWith(
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 4),
              CustomTextField(
                hintText: LocaleKeys.password_hint.tr(),
                controller: passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    AppNavigator.push(context, const ForgotPasswordPage());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      LocaleKeys.forgot_password.tr(),
                      style: AppTypography.bodyMediumMedium.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              PrimaryButton(
                onPress: () {
                  AppNavigator.push(context, const MainPage());
                },
                buttonText: LocaleKeys.log_me_in.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
