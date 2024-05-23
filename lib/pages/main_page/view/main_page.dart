import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/main_page/cubit/main_page_cubit.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  List<Widget> screens = [
    Center(
      child: Text("DashBoard"),
    ),
    Center(
      child: Text("Attendance"),
    ),
    Center(
      child: Text("Reports"),
    ),
    Center(
      child: Text("Messages"),
    ),
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
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: CircleAvatar(
                  radius: 20,
                  child: Icon(Icons.person),
                ),
              ),
              title: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Good Morning, Lilian',
                  style: AppTypography.headingH2,
                ),
                subtitle: Text('Lets be productive today'),
                trailing: SvgPicture.asset(
                  Assets.appIcons.svg.notification,
                  colorFilter: const ColorFilter.mode(
                    AppColors.textColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            body: screens.elementAt(MainPageState.values.indexOf(state)),
            bottomNavigationBar: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: BottomNavigationBar(
                backgroundColor: AppColors.white,
                selectedLabelStyle: AppTypography.bodyExtraSmallMedium,
                unselectedLabelStyle: AppTypography.bodyExtraSmallMedium,
                selectedItemColor: AppColors.secondary,
                unselectedItemColor: AppColors.textColor.withOpacity(0.5),
                type: BottomNavigationBarType.fixed,
                currentIndex: MainPageState.values.indexOf(state),
                onTap: (index) {
                  cubit.updateIndex(MainPageState.values[index]);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
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
            ),
          );
        },
      ),
    );
  }
}
