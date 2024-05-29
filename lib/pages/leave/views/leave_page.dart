import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/leave/views/apply_for_leave_page.dart';
import 'package:worklin/pages/leave/widgets/leave_tile.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/enums.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/custom_text_field.dart';
import 'package:worklin/utils/widgets/gradient_container.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      iconSize: 27,
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
                            )
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
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                // shrinkWrap: true,
                children: const [
                  LeaveTile(
                    status: LeaveCardStatus.pending,
                  ),
                  LeaveTile(
                    status: LeaveCardStatus.approved,
                    type: LeaveCardType.casual,
                  ),
                  LeaveTile(
                    type: LeaveCardType.earned,
                  ),
                  LeaveTile(
                    status: LeaveCardStatus.pending,
                  ),
                  LeaveTile(
                    status: LeaveCardStatus.approved,
                    type: LeaveCardType.casual,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          AppNavigator.push(context, const ApplyForLeavePage());
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
