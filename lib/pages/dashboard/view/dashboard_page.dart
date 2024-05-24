import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/pages/dashboard/widgets/action_widget.dart';
import 'package:worklin/pages/main_page/cubit/main_page_cubit.dart';
import 'package:worklin/pages/reports/views/create_report_page.dart';
import 'package:worklin/pages/task/views/task_page.dart';
import 'package:worklin/pages/task/widgets/task_tile.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<WorkStats> chartData = [
    WorkStats("1 Apr", 6),
    WorkStats("2 Apr", 5),
    WorkStats("3 Apr", 3),
    WorkStats("4 Apr", 8),
    WorkStats("5 Apr", 10),
    WorkStats("6 Apr", 2),
    WorkStats("7 Apr", 7),
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MainPageCubit>();
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
              border: Border.all(
                color: AppColors.inactive.withOpacity(0.8),
                width: 0.5,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: ActionWidget(
                    onTap: () {
                      cubit.updateIndex(MainPageState.attendance);
                    },
                    backGroundColor: AppColors.secondary,
                    iconPath: Assets.appIcons.svg.calendarTickWhite,
                    text: 'Take Attendance',
                  ),
                ),
                Expanded(
                  child: ActionWidget(
                    onTap: () {
                      AppNavigator.push(context, const TaskPage());
                    },
                    backGroundColor: AppColors.orange,
                    iconPath: Assets.appIcons.svg.taskSquareWhiteOutlined,
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
                    onTap: () {
                      AppNavigator.push(context, const CreateReportPage());
                    },
                    backGroundColor: AppColors.blue,
                    iconPath: Assets.appIcons.svg.trendUpWhite,
                    text: 'Add Report',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.inactive.withOpacity(0.8),
                width: 0.5,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Task",
                      style: AppTypography.bodyLargeMedium.copyWith(
                        color: AppColors.textColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        AppNavigator.push(context, const TaskPage());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "See all",
                          style: AppTypography.bodySmallSemiBold.copyWith(
                            color: AppColors.secondary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: const [
                    TaskTile(
                      progress: 23,
                      isRecent: true,
                    ),
                    TaskTile(
                      progress: 100,
                      isRecent: true,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.inactive.withOpacity(0.8),
                width: 0.5,
              ),
            ),
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
                axisLine: AxisLine(width: 0),
              ),
              primaryYAxis: NumericAxis(
                majorGridLines: MajorGridLines(width: 0),
                axisLine: AxisLine(width: 0),
              ), // This will handle the String values
              series: <CartesianSeries<WorkStats, String>>[
                ColumnSeries<WorkStats, String>(
                  dataSource: chartData,
                  xValueMapper: (WorkStats data, _) => data.month,
                  yValueMapper: (WorkStats data, _) => data.hours,
                  pointColorMapper: (WorkStats data, _) =>
                      data.hours < 4 ? AppColors.orange : AppColors.secondary,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class WorkStats {
  WorkStats(this.month, this.hours);

  final String month;
  final double hours;
}
