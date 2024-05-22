
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/widgets/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SvgPicture.asset(
                  Assets.appIcons.svg.appLogoDark,
                ),
              ),
              Row(
                children: [
                  Image.asset(Assets.appImages.handWave.path),
                ],
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: "hello, hshgsg sgsg",
                controller: emailController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: "hello, hshgsg sgsg",
                controller: emailController,
                isPassword: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
