import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/pages/profile/view/profile_page.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';

class SideDrawerWidget extends StatelessWidget {
  const SideDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: AppColors.white,
      ),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              AppNavigator.push(context, const ProfilePage());
            },
            leading: const CircleAvatar(
              radius: 20,
              child: Icon(Icons.person),
            ),
            title: Text(
              "TABE LILLIAN",
              style: AppTypography.headingH2,
            ),
            subtitle: Text(
              "UI/UX + Brand Designer",
              style: AppTypography.bodySmallRegular.copyWith(
                color: AppColors.textColor.withOpacity(0.5),
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.textColor,
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(
              Assets.appIcons.svg.tickCircle,
              colorFilter: const ColorFilter.mode(
                AppColors.green_1,
                BlendMode.srcIn,
              ),
            ),
            title: Text(
              "Active",
              style: AppTypography.headingH2,
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(
              Assets.appIcons.svg.locationOutline,
              colorFilter: const ColorFilter.mode(
                AppColors.textColor,
                BlendMode.srcIn,
              ),
            ),
            title: Text(
              "Your Work Location",
              style: AppTypography.bodyLargeRegular,
            ),
            subtitle: Text(
              "Remote",
              style: AppTypography.bodyMediumLight,
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(
              Assets.appIcons.svg.documentTextOutline,
              colorFilter: const ColorFilter.mode(
                AppColors.textColor,
                BlendMode.srcIn,
              ),
            ),
            title: Text(
              "Documents",
              style: AppTypography.bodyLargeRegular,
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(
              Assets.appIcons.svg.notificationOutline,
              colorFilter: const ColorFilter.mode(
                AppColors.textColor,
                BlendMode.srcIn,
              ),
            ),
            title: Text(
              "Notifications",
              style: AppTypography.bodyLargeRegular,
            ),
            subtitle: Text(
              "On",
              style: AppTypography.bodyMediumLight,
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(
              Assets.appIcons.svg.settingOutline,
              colorFilter: const ColorFilter.mode(
                AppColors.textColor,
                BlendMode.srcIn,
              ),
            ),
            title: Text(
              "Settings",
              style: AppTypography.bodyLargeRegular,
            ),
          ),
          ListTile(
            onTap: (){
              AppNavigator.popUntilFirst(context);
            },
            leading: SvgPicture.asset(
              Assets.appIcons.svg.logout,
              colorFilter: const ColorFilter.mode(
                AppColors.warning,
                BlendMode.srcIn,
              ),
            ),
            title: Text(
              "Log Out",
              style: AppTypography.bodyLargeRegular.copyWith(
                color: AppColors.warning,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
