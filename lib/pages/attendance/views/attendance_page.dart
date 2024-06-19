import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/attendance/cubits/attendance_cubit.dart';
import 'package:worklin/pages/attendance/views/attendance_history_view.dart';
import 'package:worklin/pages/attendance/views/attendance_summary_view.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TabBar(
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  dividerHeight: 1,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 0,
                  indicator: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelPadding: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.center,
                  controller: tabController,
                  labelColor: AppColors.white,
                  labelStyle: AppTypography.bodyExtraSmallMedium,
                  unselectedLabelColor: AppColors.textColor,
                  unselectedLabelStyle: AppTypography.bodyExtraSmallRegular,
                  tabs: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 8,
                      ),
                      child: Text(LocaleKeys.attendance_summary.tr()),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 8,
                      ),
                      child: Text(LocaleKeys.attendance_history.tr()),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                AttendanceSummaryView(),
                AttendanceHistoryView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
