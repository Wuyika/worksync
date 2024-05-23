import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/dashboard/view/dashboard_page.dart';
import 'package:worklin/pages/main_page/cubit/main_page_cubit.dart';
import 'package:worklin/pages/messages/view/message_page.dart';
import 'package:worklin/pages/profile/view/profile_page.dart';
import 'package:worklin/pages/reports/view/report_page.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/appbar.dart';
import 'package:worklin/utils/widgets/bottom_appbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  List<Widget> screens = [
    DashboardPage(),
    Center(
      child: Text("Attendance"),
    ),
    ReportPage(),
    MessagePage(),
    Center(
      child: Text("Leaves"),
    ),
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
            appBar: CustomAppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: InkWell(
                  onTap: () {
                    AppNavigator.push(context, const ProfilePage());
                  },
                  child: const CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person),
                  ),
                ),
              ),
              title: state == MainPageState.dashboard
                  ? 'Good Morning, Lilian'
                  : state == MainPageState.attendance
                      ? LocaleKeys.attendance.tr()
                      : state == MainPageState.reports
                          ? LocaleKeys.reports.tr()
                          : state == MainPageState.messages
                              ? LocaleKeys.messages.tr()
                              : LocaleKeys.leaves.tr(),
              subtitle: state == MainPageState.dashboard
                  ? "Lets be productive today"
                  : null,
              trailing: SvgPicture.asset(
                Assets.appIcons.svg.notification,
                colorFilter: const ColorFilter.mode(
                  AppColors.textColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            // appBar: AppBar(

            //   title: ListTile(
            //     contentPadding: EdgeInsets.zero,
            //     title: Text(
            //       'Good Morning, Lilian',
            //       style: AppTypography.headingH2,
            //     ),
            //     subtitle: Text('Lets be productive today'),
            //     trailing: ,
            //     ),
            //   ),
            // ),
            drawer: Drawer(),
            body: screens.elementAt(MainPageState.values.indexOf(state)),
            bottomNavigationBar: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
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
