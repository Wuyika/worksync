import 'package:flutter/material.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/button.dart';

class ApplyForLeavePage extends StatelessWidget {
  const ApplyForLeavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Apply For Leave",
          style: AppTypography.headingH2,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            PrimaryButton(
              onPress: () {},
              buttonText: "Submit For Approval",
            ),
          ],
        ),
      ),
    );
  }
}
