import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/task/widgets/task_tile.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/appbar.dart';
import 'package:worklin/utils/widgets/custom_text_field.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: Text(
          LocaleKeys.tasks.tr(),
          style: AppTypography.headingH2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 48,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      filled: true,
                      prefix: const Icon(Icons.search),
                      hintText: "${LocaleKeys.search.tr()}...",
                      controller: searchController,
                    ),
                  ),
                  const SizedBox(width: 32),
                  PopupMenuButton(
                    surfaceTintColor: AppColors.white,
                    position: PopupMenuPosition.under,
                    color: AppColors.white,
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
                            LocaleKeys.all_task.tr(),
                            style: AppTypography.bodySmallMedium.copyWith(
                              color: AppColors.selector,
                            ),
                          ),
                          const Icon(
                            size: 28,
                            Icons.arrow_drop_down,
                            color: AppColors.selector,
                          )
                        ],
                      ),
                    ),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          onTap: () {},
                          child: Text(
                            LocaleKeys.completed.tr(),
                            style: AppTypography.bodySmallMedium.copyWith(
                              color: AppColors.selector,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {},
                          child: Text(
                            LocaleKeys.uncompleted.tr(),
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
                  TaskTile(
                    progress: 45,
                  ),
                  TaskTile(
                    progress: 100.0,
                  ),
                  TaskTile(
                    progress: 15.6,
                  ),
                  TaskTile(
                    progress: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
