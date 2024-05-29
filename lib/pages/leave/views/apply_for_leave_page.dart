import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/helper_classes.dart';
import 'package:worklin/utils/helpers.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/appbar.dart';
import 'package:worklin/utils/widgets/button.dart';
import 'package:worklin/utils/widgets/custom_text_field.dart';

class ApplyForLeavePage extends StatefulWidget {
  const ApplyForLeavePage({super.key});

  @override
  State<ApplyForLeavePage> createState() => _ApplyForLeavePageState();
}

class _ApplyForLeavePageState extends State<ApplyForLeavePage> {
  TextEditingController leaveTypeController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  CustomDateTimeController dateFromController = CustomDateTimeController();
  CustomDateTimeController dateToController = CustomDateTimeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: Text(
          LocaleKeys.apply_leave.tr(),
          style: AppTypography.headingH2,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  LocaleKeys.type_of_leave.tr(),
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
              readOnly: true,
              hintText:  LocaleKeys.enter_response.tr(),
              controller: leaveTypeController,
              filled: true,
              showBottomBorder: true,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  Assets.appIcons.svg.arrowDown,
                  colorFilter: ColorFilter.mode(
                    AppColors.textColor.withOpacity(0.5),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  LocaleKeys.date.tr(),
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
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText:  LocaleKeys.from.tr(),
                    controller: dateFromController.textController,
                    onTap: () async {
                      final date = await showDatePickerCustom(
                        context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(
                          const Duration(days: 100),
                        ),
                      );
                      if (date != null){
                        dateFromController.setDateTime(date);
                      }
                    },
                    filled: true,
                    readOnly: true,
                    showBottomBorder: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        Assets.appIcons.svg.calendarOutline,
                        colorFilter: ColorFilter.mode(
                          AppColors.textColor.withOpacity(0.5),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextField(
                    hintText:  LocaleKeys.to.tr(),
                    controller: dateToController.textController,
                    onTap: () async {
                      if(dateFromController.getDateTime() != null){
                        final date = await showDatePickerCustom(
                          context,
                          firstDate: dateFromController.dateTimeValue!,
                          lastDate: DateTime.now().add(
                            const Duration(days: 30),
                          ),
                        );
                        if (date != null){
                          dateToController.setDateTime(date);
                        }
                      }
                    },
                    filled: true,
                    readOnly: true,
                    showBottomBorder: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        Assets.appIcons.svg.calendarOutline,
                        colorFilter: ColorFilter.mode(
                          AppColors.textColor.withOpacity(0.5),
                          BlendMode.srcIn,
                        ),
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
                  LocaleKeys.note.tr(),
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
              hintText:  LocaleKeys.enter_response.tr(),
              controller: noteController,
              filled: true,
              maxLines: 4,
              showBottomBorder: true,
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              onPress: () {
                showDialogCard(
                  context,
                  titleText:  LocaleKeys.leave_submit_success.tr(),
                  actionText:  LocaleKeys.okay.tr(),
                  descriptionText:  LocaleKeys.leave_submit_success_desc.tr(),
                ).then((value) => AppNavigator.pop(context, true));
              },
              buttonText:  LocaleKeys.submit_leave.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
