import 'package:flutter/material.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/button.dart';

class NoMessageWidget extends StatelessWidget {
  final VoidCallback setChart;
  const NoMessageWidget({super.key, required this.setChart});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Center(
          child: Image.asset(Assets.appImages.noMessage.path),
        ),
        const SizedBox(height: 20),
        Text(
          "You currently have no chats. You will find all Your chats here.",
          textAlign: TextAlign.center,
          style: AppTypography.bodyLargeRegular,
        ),
        const SizedBox(height: 40),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/8),
          child: PrimaryButton(
            onPress: setChart,
            buttonText: "Create Chart",
          ),
        ),
      ],
    );
  }
}
