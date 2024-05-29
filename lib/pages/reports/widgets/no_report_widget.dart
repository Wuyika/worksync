import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/button.dart';

class NoReportWidget extends StatelessWidget {
  final VoidCallback setReport;
  const NoReportWidget({super.key, required this.setReport});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Center(
          child: Image.asset(Assets.appImages.noReport.path),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/8),
          child: Text(
            LocaleKeys.create_report_description.tr(),
            textAlign: TextAlign.center,
            style: AppTypography.bodyLargeRegular,
          ),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/8),
          child: PrimaryButton(
            onPress: setReport,
            buttonText: LocaleKeys.create_report.tr(),
          ),
        ),
      ],
    );
  }
}
