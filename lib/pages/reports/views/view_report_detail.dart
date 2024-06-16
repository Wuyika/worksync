import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/helpers.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/appbar.dart';
import 'package:worklin/utils/widgets/button.dart';
import 'package:worklin/utils/widgets/custom_text_field.dart';

class ViewReportPage extends StatefulWidget {
  const ViewReportPage({super.key});

  @override
  State<ViewReportPage> createState() => _ViewReportPageState();
}

class _ViewReportPageState extends State<ViewReportPage> {
  TextEditingController whatsNewController = TextEditingController();
  TextEditingController planController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  bool editingNew = false;
  bool editingPlan = false;
  bool editingComment = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: Text(
          LocaleKeys.report_detail.tr(),
          style: AppTypography.headingH2,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Stack(
              children: [
                CustomTextField(
                  readOnly: !editingNew,
                  hintText: LocaleKeys.enter_response.tr(),
                  controller: whatsNewController,
                  filled: editingNew,
                  maxLines: 3,
                  showBottomBorder: true,
                ),
                if (!editingNew)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          editingNew = true;
                          editingComment = false;
                          editingPlan = false;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          Assets.appIcons.svg.editFormOutline,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
              ],
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
            Stack(
              children: [
                CustomTextField(
                  readOnly: !editingPlan,
                  hintText: LocaleKeys.enter_response.tr(),
                  controller: planController,
                  filled: editingPlan,
                  maxLines: 3,
                  showBottomBorder: true,
                ),
                if (!editingPlan)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          editingPlan = true;
                          editingNew = false;
                          editingComment = false;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          Assets.appIcons.svg.editFormOutline,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              LocaleKeys.comments.tr(),
              style: AppTypography.bodySmallMedium,
            ),
            const SizedBox(height: 8),
            Stack(
              children: [
                CustomTextField(
                  readOnly: !editingComment,
                  hintText: LocaleKeys.enter_response.tr(),
                  controller: commentController,
                  filled: editingComment,
                  maxLines: 3,
                  showBottomBorder: true,
                ),
                if (!editingComment)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          editingComment = true;
                          editingPlan = false;
                          editingNew = false;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          Assets.appIcons.svg.editFormOutline,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              LocaleKeys.attachments.tr(),
              style: AppTypography.bodySmallMedium,
            ),
            const SizedBox(height: 4),
            InkWell(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  titleText: LocaleKeys.report_edit_success.tr(),
                  actionText: LocaleKeys.okay.tr(),
                  descriptionText: LocaleKeys.report_edit_success_desc.tr(),
                ).then((value) => AppNavigator.pop(context, true));
              },
              buttonText: LocaleKeys.save_report.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
