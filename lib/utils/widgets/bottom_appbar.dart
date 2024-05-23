import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/main_page/cubit/main_page_cubit.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int currentIndex;
  final MainPageState state;
  final void Function(int)? onTap;

  const CustomBottomAppBar({
    super.key,
    required this.currentIndex,
    required this.state,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: BottomNavigationBar(
        backgroundColor: AppColors.white,
        selectedLabelStyle: AppTypography.bodyExtraSmallMedium,
        unselectedLabelStyle: AppTypography.bodyExtraSmallMedium,
        selectedItemColor: AppColors.secondary,
        unselectedItemColor: AppColors.textColor.withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
        currentIndex: MainPageState.values.indexOf(state),
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              width: 20,
              height: 20,
              Assets.appIcons.svg.dashboard,
              colorFilter: ColorFilter.mode(
                state == MainPageState.dashboard
                    ? AppColors.secondary
                    : AppColors.textColor.withOpacity(0.5),
                BlendMode.srcIn,
              ),
            ),
            label: LocaleKeys.dashboard.tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              width: 20,
              height: 20,
              Assets.appIcons.svg.calendarTick,
              colorFilter: ColorFilter.mode(
                state == MainPageState.attendance
                    ? AppColors.secondary
                    : AppColors.textColor.withOpacity(0.5),
                BlendMode.srcIn,
              ),
            ),
            label: LocaleKeys.attendance.tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              width: 20,
              height: 20,
              Assets.appIcons.svg.chart,
              colorFilter: ColorFilter.mode(
                state == MainPageState.reports
                    ? AppColors.secondary
                    : AppColors.textColor.withOpacity(0.5),
                BlendMode.srcIn,
              ),
            ),
            label: LocaleKeys.reports.tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              width: 20,
              height: 20,
              Assets.appIcons.svg.messages2,
              colorFilter: ColorFilter.mode(
                state == MainPageState.messages
                    ? AppColors.secondary
                    : AppColors.textColor.withOpacity(0.5),
                BlendMode.srcIn,
              ),
            ),
            label: LocaleKeys.messages.tr(),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              width: 20,
              height: 20,
              Assets.appIcons.svg.personalcard,
              colorFilter: ColorFilter.mode(
                state == MainPageState.leaves
                    ? AppColors.secondary
                    : AppColors.textColor.withOpacity(0.5),
                BlendMode.srcIn,
              ),
            ),
            label: LocaleKeys.leaves.tr(),
          ),
        ],
      ),
    );
  }
}
