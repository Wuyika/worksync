import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/enums.dart';
import 'package:worklin/utils/typography.dart';

class LeaveTile extends StatelessWidget {
  final LeaveCardStatus status;
  final LeaveCardType type;

  const LeaveTile({
    super.key,
    this.status = LeaveCardStatus.rejected,
    this.type = LeaveCardType.sick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Tue, 09 Apr 2024 - Thu, 11 Apr 2024",
                  style: AppTypography.bodySmallSemiBold,
                ),
              ),
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: status == LeaveCardStatus.pending
                      ? AppColors.orange.withOpacity(0.2)
                      : status == LeaveCardStatus.approved
                          ? AppColors.green_1.withOpacity(0.2)
                          : AppColors.warning.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  status.name.tr(),
                  style: AppTypography.bodySmallMedium.copyWith(
                    color: status == LeaveCardStatus.pending
                        ? AppColors.orange
                        : status == LeaveCardStatus.approved
                            ? AppColors.green_1
                            : AppColors.warning,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "Lorem ipsum dolor sit amet consectetur. Purus eget ipsum dui vivamus viverra sed urna ipsum dolor sit amet.",
            style: AppTypography.bodySmallRegular,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.circle,
                size: 20,
                color: type == LeaveCardType.casual
                    ? AppColors.orange
                    : type == LeaveCardType.sick
                    ? AppColors.green_1
                    : AppColors.secondary,
              ),
              const SizedBox(width: 8),
              Text(
                type == LeaveCardType.casual
                    ? LocaleKeys.casual_leave.tr()
                    : type == LeaveCardType.sick
                    ? LocaleKeys.sick_leave.tr()
                    : LocaleKeys.earned_leave.tr(),
                style: AppTypography.bodySmallRegular,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
