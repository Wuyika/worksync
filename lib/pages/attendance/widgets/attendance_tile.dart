import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/enums.dart';
import 'package:worklin/utils/typography.dart';

class AttendanceTile extends StatelessWidget {
  final AttendanceTime type;

  const AttendanceTile({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          left: BorderSide(
            width: 4,
            color: type == AttendanceTime.onTime
                ? AppColors.green_1
                : type == AttendanceTime.late
                    ? AppColors.orange
                    : AppColors.secondary,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12, right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Tue, 09 Apr 2024",
                    style: AppTypography.bodySmallSemiBold.copyWith(
                      fontWeight: AppTypography.weightMedium,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: type == AttendanceTime.onTime
                        ? AppColors.green_1.withOpacity(0.2)
                        : type == AttendanceTime.late
                        ? AppColors.orange.withOpacity(0.2)
                        : AppColors.secondary.withOpacity(0.1),
                    // color: AppColors.green_1.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4,
                    children: [
                      Icon(
                        Icons.circle,
                        color: type == AttendanceTime.onTime
                            ? AppColors.green_1
                            : type == AttendanceTime.late
                                ? AppColors.orange
                                : AppColors.secondary,
                        size: 16,
                      ),
                      Text(
                        type == AttendanceTime.onTime
                            ? LocaleKeys.on_time.tr()
                            : type == AttendanceTime.late
                                ? LocaleKeys.late.tr()
                                : LocaleKeys.early_leave.tr(),
                        style: AppTypography.bodySmallMedium.copyWith(
                          color: AppColors.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        LocaleKeys.check_in.tr(),
                        style: AppTypography.bodySmallSemiBold.copyWith(
                          color: AppColors.textColor.withOpacity(0.5),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "08:01 AM",
                        style: AppTypography.bodyMediumMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 44,
                  width: 0,
                  child: VerticalDivider(
                    color: AppColors.textColor.withOpacity(0.5),
                    thickness: 1.5,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        LocaleKeys.check_out.tr(),
                        style: AppTypography.bodySmallSemiBold.copyWith(
                          color: AppColors.textColor.withOpacity(0.5),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "__:__ PM",
                        style: AppTypography.bodyMediumMedium,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 44,
                  child: VerticalDivider(
                    color: AppColors.textColor.withOpacity(0.5),
                    thickness: 1.5,
                    width: 0,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        LocaleKeys.total_hours.tr(),
                        style: AppTypography.bodySmallSemiBold.copyWith(
                          color: AppColors.textColor.withOpacity(0.5),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "03h 48m",
                        style: AppTypography.bodyMediumMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
