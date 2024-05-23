import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/pages/dashboard/widgets/action_widget.dart';
import 'package:worklin/utils/colors.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: ActionWidget(
                    backGroundColor: AppColors.secondary,
                    iconPath: Assets.appIcons.svg.calendarTickWhite,
                    text: 'Take Attendance',
                  ),
                ),
                Expanded(
                  child: ActionWidget(
                    backGroundColor: AppColors.orange,
                    iconPath: Assets.appIcons.svg.taskSquareWhite,
                    text: 'View Tasks',
                  ),
                ),
                Expanded(
                  child: ActionWidget(
                    backGroundColor: AppColors.green,
                    iconPath: Assets.appIcons.svg.receiptTextWhite,
                    text: 'View Payslip',
                  ),
                ),
                Expanded(
                  child: ActionWidget(
                    backGroundColor: AppColors.blue,
                    iconPath: Assets.appIcons.svg.trendUpWhite,
                    text: 'Add Report',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
