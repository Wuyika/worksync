import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/auth/signin/view/signin_page.dart';
import 'package:worklin/pages/profile/view/profile_page.dart';
import 'package:worklin/pages/setting/settings_page.dart';
import 'package:worklin/providers/app_data.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/enums.dart';
import 'package:worklin/utils/helpers.dart';
import 'package:worklin/utils/my_pref.dart';
import 'package:worklin/utils/sizes.dart';
import 'package:worklin/utils/typography.dart';

class SideDrawerWidget extends StatelessWidget {
  const SideDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AppData.currentUser;
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: const BoxDecoration(
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
              user?.fullName ?? "",
              style: AppTypography.bodyMediumMedium,
            ),
            subtitle: Text(
              user?.position ?? "",
              style: AppTypography.bodySmallRegular.copyWith(
                color: AppColors.textColor.withOpacity(0.5),
              ),
            ),
            trailing: const Icon(
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
              LocaleKeys.active.tr(),
              style: AppTypography.bodyMediumRegular,
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
              LocaleKeys.your_work_location.tr(),
              style: AppTypography.bodyMediumRegular,
            ),
            subtitle: Text(
              "Remote",
              style: AppTypography.bodySmallLight,
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
              LocaleKeys.documents.tr(),
              style: AppTypography.bodyMediumRegular,
            ),
          ),
          ListTile(
            onTap: (){
              print(AppData.token);
            },
            leading: SvgPicture.asset(
              Assets.appIcons.svg.notificationOutline,
              colorFilter: const ColorFilter.mode(
                AppColors.textColor,
                BlendMode.srcIn,
              ),
            ),
            title: Text(
              LocaleKeys.notification.tr(),
              style: AppTypography.bodyMediumRegular,
            ),
            subtitle: Text(
              "On",
              style: AppTypography.bodySmallLight,
            ),
          ),
          ListTile(
            splashColor: AppColors.secondary.withOpacity(0.5),
            onTap: () {
              AppNavigator.push(context, const SettingsPage());
            },
            leading: SvgPicture.asset(
              Assets.appIcons.svg.settingOutline,
              colorFilter: const ColorFilter.mode(
                AppColors.textColor,
                BlendMode.srcIn,
              ),
            ),
            title: Text(
              LocaleKeys.settings.tr(),
              style: AppTypography.bodyMediumRegular,
            ),
          ),
          ListTile(
            onTap: () async {
              showDialogCard(
                context,
                titleText: LocaleKeys.log_out.tr(),
                actionText: LocaleKeys.log_out.tr(),
                descriptionText: "Are you sure you want to logout?",
                dialogType: DialogType.failure,
              ).then((value) {
                if (value == true) {
                  MyPref.logOutUser();
                  AppNavigator.removeAllPreviousAndPush(
                      context, const SignInPage());
                }
              });
            },
            leading: SvgPicture.asset(
              Assets.appIcons.svg.logout,
              colorFilter: const ColorFilter.mode(
                AppColors.warning,
                BlendMode.srcIn,
              ),
            ),
            title: Text(
              LocaleKeys.log_out.tr(),
              style: AppTypography.bodyMediumRegular.copyWith(
                color: AppColors.warning,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
