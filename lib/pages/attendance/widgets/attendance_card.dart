import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/attendance/cubits/attendance_summary_cubit.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/helper_classes.dart';
import 'package:worklin/utils/sizes.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/button.dart';

class AttendanceCard extends StatelessWidget {
  final AttendanceSummaryState state;
  final VoidCallback checkIn;
  final VoidCallback checkOut;

  const AttendanceCard({
    super.key,
    required this.checkIn,
    required this.checkOut,
    this.state = AttendanceSummaryState.checkIn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              (state == AttendanceSummaryState.checkIn)
                  ? LocaleKeys.make_attendance.tr()
                  : (state == AttendanceSummaryState.checkOut)
                      ? LocaleKeys.mark_attendance.tr()
                      : LocaleKeys.end_of_day.tr(),
              style: AppTypography.bodyLargeMedium,
            ),
          ),
          const SizedBox(height: 2),
          GradientText(
            text: "08:00:50 AM",
            style: AppTypography.bodyLargeRegular.copyWith(
              fontSize: 28,
              fontWeight: AppTypography.weightBold,
            ),
            gradient: const LinearGradient(
              colors: [
                AppColors.secondary, // Your provided color code
                Colors.purple, // Generic purple color
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Mon, 08 Apr 2024",
            style: AppTypography.bodySmallMedium.copyWith(
              color: AppColors.textColor.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 16),
          if (state == AttendanceSummaryState.checkIn)
            InkWell(
              onTap: checkIn,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondary,
                  border: Border.all(
                    width: 6,
                    color: AppColors.white.withOpacity(0.85),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Text(
                    LocaleKeys.check_in.tr(),
                    style: AppTypography.bodySmallMedium.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            )
          else if (state == AttendanceSummaryState.checkOut)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width / 6,
              ),
              child: PrimaryOutlinedButton(
                onPress: checkOut,
                buttonText: LocaleKeys.check_out.tr(),
              ),
            )
          else
            Image.asset(Assets.appImages.attenanceCheckout.path),
          const SizedBox(height: 16),
          if (state == AttendanceSummaryState.checkIn)
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                LocaleKeys.check_in_description.tr(),
                style: AppTypography.bodySmallMedium,
              ),
            )
          else
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.size_16),
              child: Column(
                children: [
                  const SizedBox(height: 2),
                  Divider(
                    color: AppColors.textColor.withOpacity(0.2),
                    thickness: 1.5,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(Assets.appIcons.svg.clockTime),
                          const SizedBox(height: 4),
                          Text(
                            "08:01 AM",
                            style: AppTypography.bodyMediumMedium,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            LocaleKeys.check_in.tr(),
                            style: AppTypography.bodySmallSemiBold.copyWith(
                              color: AppColors.textColor.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 28,
                        child: VerticalDivider(
                          color: AppColors.textColor.withOpacity(0.5),
                          thickness: 1.5,
                          width: Sizes.size_2,
                        ),
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(Assets.appIcons.svg.timerRound),
                          const SizedBox(height: 4),
                          Text(
                            "__:__ PM",
                            style: AppTypography.bodyMediumMedium,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            LocaleKeys.check_out.tr(),
                            style: AppTypography.bodySmallSemiBold.copyWith(
                              color: AppColors.textColor.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 28,
                        child: VerticalDivider(
                          color: AppColors.textColor.withOpacity(0.5),
                          thickness: 1.5,
                          width: Sizes.size_2,
                        ),
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(Assets.appIcons.svg.timer),
                          const SizedBox(height: 4),
                          Text(
                            "03h 48m",
                            style: AppTypography.bodyMediumMedium,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            LocaleKeys.total_hours.tr(),
                            style: AppTypography.bodySmallSemiBold.copyWith(
                              color: AppColors.textColor.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
