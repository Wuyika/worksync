import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/reports/views/create_report_page.dart';
import 'package:worklin/pages/reports/widgets/no_report_widget.dart';
import 'package:worklin/pages/reports/widgets/report_tile.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/custom_text_field.dart';
import 'package:worklin/utils/widgets/gradient_container.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  TextEditingController searchController = TextEditingController();
  bool noReport = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: noReport == true
          ? NoReportWidget(
              setReport: () async {
                final value =
                    await AppNavigator.push(context, const CreateReportPage());
                if (value == true) {
                  setState(() {
                    noReport = false;
                  });
                }
              },
            )
          : Padding(
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
                            hintText: "Search...",
                            controller: searchController,
                          ),
                        ),
                        const SizedBox(width: 40),
                        PopupMenuButton(
                          iconSize: 27,
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
                                  LocaleKeys.this_month.tr(),
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
                                  LocaleKeys.this_year.tr(),
                                  style: AppTypography.bodySmallMedium.copyWith(
                                    color: AppColors.selector,
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                onTap: () {},
                                child: Text(
                                  LocaleKeys.last_month.tr(),
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
                        ReportTile(),
                        ReportTile(),
                        ReportTile(),
                        ReportTile(),
                        ReportTile(),
                        ReportTile(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: noReport == true
          ? null
          : InkWell(
              onTap: () {
                AppNavigator.push(context, const CreateReportPage());
              },
              child: GradientContainer(
                width: 48,
                height: 48,
                borderRadius: BorderRadius.circular(10),
                child: const Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
              ),
            ),
    );
  }
}
