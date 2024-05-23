import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/button.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Center(
            child: Image.asset(Assets.appImages.noReport.path),
          ),
          const SizedBox(height: 20),
          Text(
            "Create reports to keep your employer updated.",
            textAlign: TextAlign.center,
            style: AppTypography.bodyLargeRegular,
          ),
          const SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/8),
            child: PrimaryButton(
              onPress: () {},
              buttonText: "Create Report",
            ),
          ),
        ],
      ),
    );
  }
}
