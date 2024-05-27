import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:worklin/pages/attendance/widgets/attendance_tile.dart';
import 'package:worklin/pages/attendance/widgets/type.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/enums.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/custom_text_field.dart';

class AttendanceHistoryView extends StatefulWidget {
  const AttendanceHistoryView({super.key});

  @override
  State<AttendanceHistoryView> createState() => _AttendanceHistoryViewState();
}

class _AttendanceHistoryViewState extends State<AttendanceHistoryView> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColors.textColor.withOpacity(0.2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TypeWidget(
                  color: AppColors.green_1,
                  text: "On time",
                  value: 70,
                ),
                VerticalDivider(
                  width: 0,
                  color: AppColors.textColor.withOpacity(0.2),
                  thickness: 2,
                ),
                const TypeWidget(
                  color: AppColors.orange,
                  text: "Late",
                  value: 20,
                ),
                VerticalDivider(
                  width: 0,
                  color: AppColors.textColor.withOpacity(0.2),
                  thickness: 2,
                ),
                const TypeWidget(
                  color: AppColors.warning,
                  text: "Absent",
                  value: 5,
                ),
                VerticalDivider(
                  width: 0,
                  color: AppColors.textColor.withOpacity(0.2),
                  thickness: 2,
                ),
                const TypeWidget(
                  color: AppColors.secondary,
                  text: "Early Leaves",
                  value: 21,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 48,
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    filled: true,
                    prefix: const Icon(Icons.search),
                    hintText: "Search...",
                    controller: searchController,
                  ),
                ),
                const SizedBox(width: 32),
                PopupMenuButton(
                  surfaceTintColor: AppColors.white,
                  position: PopupMenuPosition.under,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.white,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "This Month",
                          style: AppTypography.bodySmallMedium.copyWith(
                            color: AppColors.selector,
                          ),
                        ),
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
                          tr('Today'),
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
                    ];
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              // shrinkWrap: true,
              children: const [
                AttendanceTile(
                  type: AttendanceTime.onTime,
                ),
                AttendanceTile(
                  type: AttendanceTime.late,
                ),
                AttendanceTile(
                  type: AttendanceTime.early,
                ),
                AttendanceTile(
                  type: AttendanceTime.onTime,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
