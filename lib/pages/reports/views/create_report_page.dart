import 'package:flutter/material.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/button.dart';

class CreateReportPage extends StatelessWidget {
  const CreateReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Create Report",
          style: AppTypography.headingH2,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            PrimaryButton(
              onPress: () {
                AppNavigator.pop(context, true);
              },
              buttonText: "Submit Report",
            ),
          ],
        ),
      ),
    );
  }
}
