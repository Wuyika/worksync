import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:worklin/gen/assets.gen.dart';
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
          "Report Detail",
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
                  "Whats New? ",
                  style: AppTypography.bodySmallMedium,
                ),
                Text(
                  "*",
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
                  hintText: "Enter Your Response",
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
                  "What do you plan to do today? ",
                  style: AppTypography.bodySmallMedium,
                ),
                Text(
                  "*",
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
                  hintText: "Enter Your Response",
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
              "Comments",
              style: AppTypography.bodySmallMedium,
            ),
            const SizedBox(height: 8),
            Stack(
              children: [
                CustomTextField(
                  hintText: "Enter Your Response",
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
              "Attachments",
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
                      "Add Attachment",
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
                  titleText: "Report Edited Successfully.",
                  actionText: "Okay",
                  descriptionText: "Your report has been edited successfully.",
                ).then((value) => AppNavigator.pop(context, true));
              },
              buttonText: "Save Report",
            ),
          ],
        ),
      ),
    );
  }
}
