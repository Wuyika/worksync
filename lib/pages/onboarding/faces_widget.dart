import 'package:flutter/material.dart';
import 'package:worklin/gen/assets.gen.dart';

class FacesWidget extends StatelessWidget {
  const FacesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          top: 0,
          child: Image.asset(
            Assets.appImages.onboardingImage1.path,
            scale: 0.9,
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Image.asset(
            Assets.appImages.onboardingImage2.path,
            scale: 0.9,
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Image.asset(
            Assets.appImages.onboardingImage4.path,
            scale: 0.9,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Image.asset(
            Assets.appImages.onboardingImage5.path,
            scale: 0.9,
          ),
        ),
        Align(
          child: Image.asset(
            Assets.appImages.onboardingImage3.path,
            scale: 0.9,
          ),
        ),
      ],
    );
  }
}
