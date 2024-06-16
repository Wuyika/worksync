import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/helpers.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/appbar.dart';
import 'package:worklin/utils/widgets/button.dart';
import 'package:worklin/utils/widgets/custom_text_field.dart';

class CreateReportPage extends StatefulWidget {
  const CreateReportPage({super.key});

  @override
  State<CreateReportPage> createState() => _CreateReportPageState();
}

class _CreateReportPageState extends State<CreateReportPage> {
  TextEditingController whatsNewController = TextEditingController();
  TextEditingController planController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: Text(
          LocaleKeys.create_report.tr(),
          style: AppTypography.headingH2,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.secondary,
                ),
                child: SvgPicture.asset(
                  Assets.appIcons.svg.taskSquareWhite,
                ),
              ),
              title: Text(
                LocaleKeys.quick_update.tr(),
                style: AppTypography.bodyLargeMedium,
              ),
              subtitle: Text(
                LocaleKeys.quick_update_desc.tr(),
                style: AppTypography.bodySmallRegular,
              ),
            ),
            // const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  LocaleKeys.whats_new.tr(),
                  style: AppTypography.bodySmallMedium,
                ),
                Text(
                  " *",
                  style: AppTypography.bodySmallMedium.copyWith(
                    color: AppColors.warning,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            CustomTextField(
              hintText: LocaleKeys.enter_response.tr(),
              controller: whatsNewController,
              filled: true,
              maxLines: 3,
              showBottomBorder: true,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  LocaleKeys.whats_plan.tr(),
                  style: AppTypography.bodySmallMedium,
                ),
                Text(
                  " *",
                  style: AppTypography.bodySmallMedium.copyWith(
                    color: AppColors.warning,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            CustomTextField(
              hintText: LocaleKeys.enter_response.tr(),
              controller: planController,
              filled: true,
              maxLines: 3,
              showBottomBorder: true,
            ),
            const SizedBox(height: 16),
            Text(
              LocaleKeys.comments.tr(),
              style: AppTypography.bodySmallMedium,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              hintText: LocaleKeys.enter_response.tr(),
              controller: commentController,
              filled: true,
              maxLines: 3,
              showBottomBorder: true,
            ),
            const SizedBox(height: 16),
            Text(
              LocaleKeys.attachments.tr(),
              style: AppTypography.bodySmallMedium,
            ),
            const SizedBox(height: 4),
            InkWell(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: AppColors.inactive,
                  ),
                ),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      height: 24,
                      width: 24,
                      Assets.appIcons.svg.sendSquare,
                    ),
                    Text(
                      LocaleKeys.add_attachment.tr(),
                      style: AppTypography.bodySmallMedium.copyWith(
                        color: AppColors.textColor.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              onPress: () {
                showDialogCard(
                  context,
                  titleText: LocaleKeys.report_submit_success.tr(),
                  actionText: LocaleKeys.okay.tr(),
                  descriptionText: LocaleKeys.report_submit_success_desc.tr(),
                ).then((value) => AppNavigator.pop(context, true));
              },
              buttonText: LocaleKeys.submit_report.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
