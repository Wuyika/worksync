import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/utils/colors.dart';

class GraphWidget extends StatelessWidget {
  const GraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<WorkStats> chartData = [
      WorkStats("1 Apr", 6),
      WorkStats("2 Apr", 5),
      WorkStats("3 Apr", 3),
      WorkStats("4 Apr", 8),
      WorkStats("5 Apr", 10),
      WorkStats("6 Apr", 2),
      WorkStats("7 Apr", 7),
    ];
    return Container(
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
        title: ChartTitle(
          text:  LocaleKeys.working_stat.tr(),
          alignment: ChartAlignment.near,
        ),
        primaryXAxis: const CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
          axisLine: AxisLine(width: 0),
        ),
        primaryYAxis: const NumericAxis(
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
    );
  }
}

class WorkStats {
  WorkStats(this.month, this.hours);

  final String month;
  final double hours;
}
