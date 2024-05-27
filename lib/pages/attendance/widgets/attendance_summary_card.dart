import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/attendance/widgets/sumary_card.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';

class AttendanceSummaryCard extends StatefulWidget {
  const AttendanceSummaryCard({super.key});

  @override
  State<AttendanceSummaryCard> createState() => _AttendanceSummaryCardState();
}

class _AttendanceSummaryCardState extends State<AttendanceSummaryCard> {
  TextEditingController searchController = TextEditingController();

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
          SizedBox(
            height: 48,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                   LocaleKeys.summary.tr(),
                    style: AppTypography.bodyLargeMedium,
                  ),
                ),
                const SizedBox(width: 32),
                PopupMenuButton(
                    iconSize: 27,
                    surfaceTintColor: AppColors.white,
                    position: PopupMenuPosition.under,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.white,
                        border: Border.all(
                          color: AppColors.textColor.withOpacity(0.2),
                          width: 0.8,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Total",
                            style: AppTypography.bodySmallMedium.copyWith(
                              color: AppColors.selector,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            size: 28,
                            Icons.arrow_drop_down,
                            color: AppColors.selector,
                          ),
                        ],
                      ),
                    ),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          onTap: () {},
                          child: Text(
                            tr('This Year'),
                            style: AppTypography.bodySmallMedium.copyWith(
                              color: AppColors.selector,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {},
                          child: Text(
                            tr('Next Week'),
                            style: AppTypography.bodySmallMedium.copyWith(
                              color: AppColors.selector,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {},
                          child: Text(
                            tr('Last Month'),
                            style: AppTypography.bodySmallMedium.copyWith(
                              color: AppColors.selector,
                            ),
                          ),
                        ),
                      ];
                    }),
              ],
            ),
          ),

          const SizedBox(height: 24),
          GridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 20,
              childAspectRatio: 2,
            ),
            children: [
              SummaryCard(
                color: AppColors.green_1,
                title: LocaleKeys.on_time.tr(),
                value: 70,
              ),
              SummaryCard(
                color: AppColors.orange,
                title: LocaleKeys.late.tr(),
                value: 20,
              ),
              SummaryCard(
                color: AppColors.warning,
                title: LocaleKeys.absent.tr(),
                value: 5,
              ),
              SummaryCard(
                color: AppColors.secondary,
                title: LocaleKeys.early_leave.tr(),
                value: 21,
              ),
            ],
          ),
          // const SizedBox(height: 24),
        ],
      ),
    );
  }
}
