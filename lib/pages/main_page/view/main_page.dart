import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/attendance/views/attendance_page.dart';
import 'package:worklin/pages/dashboard/view/dashboard_page.dart';
import 'package:worklin/pages/leave/views/leave_page.dart';
import 'package:worklin/pages/main_page/cubit/main_page_cubit.dart';
import 'package:worklin/pages/messages/view/message_page.dart';
import 'package:worklin/pages/profile/view/profile_page.dart';
import 'package:worklin/pages/reports/views/report_page.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/sizes.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/appbar.dart';
import 'package:worklin/utils/widgets/bottom_appbar.dart';
import 'package:worklin/utils/widgets/drawer.dart';
import 'package:worklin/utils/globals.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  List<Widget> screens = const [
    DashboardPage(),
    AttendancePage(),
    ReportPage(),
    MessagePage(),
    LeavePage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageCubit(),
      child: BlocBuilder<MainPageCubit, MainPageState>(
        builder: (context, state) {
          final cubit = context.read<MainPageCubit>();
          return Scaffold(
            key: scaffoldKey,
            appBar: CustomAppBar(
              leading: Padding(
                padding: EdgeInsets.only(left: Sizes.size_16),
                child: InkWell(
                  onTap: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  child: const CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person),
                  ),
                ),
              ),
              title: state == MainPageState.dashboard
                  ? ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        'Good Morning, Lilian',
                        style: AppTypography.headingH2,
                      ),
                      subtitle: Text(
                        "Lets be productive today",
                        style: AppTypography.bodySmallRegular.copyWith(
                          color: AppColors.textColor.withOpacity(0.5),
                        ),
                      ),
                    )
                  : state == MainPageState.attendance
                      ? Text(
                          LocaleKeys.attendance.tr(),
                          style: AppTypography.headingH2,
                        )
                      : state == MainPageState.reports
                          ? Text(
                              LocaleKeys.reports.tr(),
                              style: AppTypography.headingH2,
                            )
                          : state == MainPageState.messages
                              ? Text(
                                  LocaleKeys.messages.tr(),
                                  style: AppTypography.headingH2,
                                )
                              : Text(
                                  LocaleKeys.leaves.tr(),
                                  style: AppTypography.headingH2,
                                ),
              actions: [
                SvgPicture.asset(
                  Assets.appIcons.svg.notification,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textColor,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: Sizes.size_16),
              ],
            ),
            drawer: const SideDrawerWidget(),
            body: screens.elementAt(MainPageState.values.indexOf(state)),
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: CustomBottomAppBar(
                currentIndex: MainPageState.values.indexOf(state),
                state: state,
                onTap: (index) {
                  cubit.updateIndex(MainPageState.values[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
