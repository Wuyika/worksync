import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/task/views/task_page.dart';
import 'package:worklin/pages/task/widgets/task_tile.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';

class RecentTaskBoard extends StatelessWidget {
  const RecentTaskBoard({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  LocaleKeys.recent_task.tr(),
                  style: AppTypography.bodyLargeMedium.copyWith(
                    color: AppColors.textColor,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  AppNavigator.push(context, const TaskPage());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    LocaleKeys.see_all.tr(),
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
    );
  }
}
