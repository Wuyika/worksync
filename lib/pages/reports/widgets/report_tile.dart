import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/reports/views/view_report_detail.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';

class ReportTile extends StatelessWidget {
  const ReportTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppNavigator.push(context, const ViewReportPage());
      },
      child: Container(
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
                    "Tue, 09 Apr 2024",
                    style: AppTypography.bodySmallSemiBold,
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Details",
                    style: AppTypography.bodySmallMedium.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.secondary,
                  ),
                  child: SvgPicture.asset(
                    Assets.appIcons.svg.taskSquareWhite,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.circle,
                            color: AppColors.textColor,
                            size: 7,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                style: AppTypography.bodySmallMedium.copyWith(
                                  color: AppColors.textColor,
                                ),
                                text: "${LocaleKeys.whats_new.tr()} ",
                                children: [
                                  TextSpan(
                                    text: " I’ve redesigned the screen for the demartologist",
                                    style: AppTypography.bodySmallMedium.copyWith(
                                      color: AppColors.textColor.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.circle,
                            color: AppColors.textColor,
                            size: 7,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                style: AppTypography.bodySmallMedium.copyWith(
                                  color: AppColors.textColor,
                                ),
                                text: "${LocaleKeys.whats_plan.tr()} ",
                                children: [
                                  TextSpan(
                                    text: " I’ve redesigned the screen for the demartologist",
                                    style: AppTypography.bodySmallMedium.copyWith(
                                      color: AppColors.textColor.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.circle,
                            color: AppColors.textColor,
                            size: 7,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                style: AppTypography.bodySmallMedium.copyWith(
                                  color: AppColors.textColor,
                                ),
                                text: "${LocaleKeys.comments.tr()}: ",
                                children: [
                                  TextSpan(
                                    text: " Try to complete",
                                    style: AppTypography.bodySmallMedium.copyWith(
                                      color: AppColors.textColor.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
