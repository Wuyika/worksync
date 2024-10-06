import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/attendance/cubits/attendance_cubit.dart';
import 'package:worklin/pages/attendance/views/scan_qr_code.dart';
import 'package:worklin/pages/attendance/widgets/attendance_card.dart';
import 'package:worklin/pages/attendance/widgets/attendance_summary_card.dart';
import 'package:worklin/utils/app_alert.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/enums.dart';
import 'package:worklin/utils/helpers.dart';
import 'package:worklin/utils/sizes.dart';

class AttendanceSummaryView extends StatefulWidget {
  final AttendanceCardType cardType;

  const AttendanceSummaryView({
    super.key,
    this.cardType = AttendanceCardType.checkIn,
  });

  @override
  State<AttendanceSummaryView> createState() => _AttendanceSummaryViewState();
}

class _AttendanceSummaryViewState extends State<AttendanceSummaryView> {
  AttendanceCardType cardType = AttendanceCardType.checkIn;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 8, left: Sizes.size_8, right: Sizes.size_8),
      child: Column(
        children: [
          BlocConsumer<AttendanceCubit, AttendanceState>(
            listener: (context, state) {
              if (state is AttendanceErrorState) {
                AppAlerts.showInfoSnackBar(state.error);
              }
            },
            builder: (context, state) {
              final pd = ProgressDialog(context: context);
              final cubit = context.read<AttendanceCubit>();
              return AttendanceCard(
                checkIn: () async {
                  try {
                    cubit.requestLocationPermission().then((value) async {
                      if (value == true) {
                        pd.show(
                          msg: "Checking In...",
                          barrierColor: Colors.black45,
                          progressBgColor: Colors.transparent,
                        );
                        cubit.getLocation().then((value) async {
                          if (value == true) {
                            await AppNavigator.push(context, const ScanQrPage())
                                .then((value) async {
                              // if (value != null) {
                              //   final code = value as String;
                              //   final id = extractNumber(code);
                              //   if (id == null) {
                              //     pd.close();
                              //     return null;
                              //   }
                              //   await cubit
                              //       .fetchCompanyBranch(companyId: id)
                              //       .then((value) async {
                              //     if (value == true) {
                              //       try {
                              //         await cubit
                              //             .calculateDistance()
                              //             .then((value) async {
                              //           if (value == true) {
                              //             pd.close();
                              //             await showDialogCard(
                              //               context,
                              //               titleText: LocaleKeys
                              //                   .check_in_successful
                              //                   .tr(),
                              //               actionText: LocaleKeys.okay.tr(),
                              //               descriptionText: LocaleKeys
                              //                   .check_in_successful_desc
                              //                   .tr(),
                              //             );
                              //           } else {
                              //             pd.close();
                              //           }
                              //         });
                              //       } catch (e) {
                              //         pd.close();
                              //       }
                              //     } else {
                              //       pd.close();
                              //     }
                              //   });
                              // } else {
                              //   pd.close();
                              // }
                              pd.close();
                              cubit.emitCheckOut();
                              await showDialogCard(
                                context,
                                titleText: LocaleKeys.check_in_successful.tr(),
                                actionText: LocaleKeys.okay.tr(),
                                descriptionText:
                                    LocaleKeys.check_in_successful_desc.tr(),
                              );
                            });
                          } else {
                            pd.close();
                          }
                        });
                      } else {
                        pd.close();
                      }
                    });
                  } catch (e) {
                    pd.close();
                  }
                  pd.close();
                },
                checkOut: () async {
                  await showDialogCard(
                    context,
                    dialogType: DialogType.failure,
                    titleText: LocaleKeys.check_out_warning.tr(),
                    actionText: LocaleKeys.check_out.tr(),
                    descriptionText: LocaleKeys.check_out_warning_desc.tr(),
                  ).then((value) {
                    if (value == true) {
                      try {
                        cubit.requestLocationPermission().then((value) async {
                          if (value == true) {
                            pd.show(
                              msg: "Checking out...",
                              barrierColor: Colors.black45,
                              progressBgColor: Colors.transparent,
                            );
                            cubit.getLocation().then((value) async {
                              if (value == true) {
                                await AppNavigator.push(
                                  context,
                                  const ScanQrPage(),
                                ).then((value) async {
                                  // if (value != null) {
                                  //   final code = value as String;
                                  //   final id = extractNumber(code);
                                  //   if (id == null) {
                                  //     pd.close();
                                  //     return null;
                                  //   }
                                  //   await cubit
                                  //       .fetchCompanyBranch(companyId: id)
                                  //       .then((value) async {
                                  //     if (value == true) {
                                  //       try {
                                  //         await cubit.calculateDistance(forCheckIn: false).then((value) async {
                                  //           if (value == true) {
                                  //             pd.close();
                                  //             await showDialogCard(
                                  //               context,
                                  //               titleText: LocaleKeys
                                  //                   .check_out_successful
                                  //                   .tr(),
                                  //               actionText: LocaleKeys.okay.tr(),
                                  //               descriptionText: LocaleKeys
                                  //                   .check_out_successful_desc
                                  //                   .tr(),
                                  //             );
                                  //           } else {
                                  //             pd.close();
                                  //           }
                                  //         });
                                  //       } catch (e) {
                                  //         pd.close();
                                  //       }
                                  //     } else {
                                  //       pd.close();
                                  //     }
                                  //   });
                                  // } else {
                                  //   pd.close();
                                  // }
                                  pd.close();
                                  cubit.emitEnd();
                                  await showDialogCard(
                                    context,
                                    titleText:
                                        LocaleKeys.check_out_successful.tr(),
                                    actionText: LocaleKeys.okay.tr(),
                                    descriptionText: LocaleKeys
                                        .check_out_successful_desc
                                        .tr(),
                                  );
                                });
                              } else {
                                pd.close();
                              }
                            });
                          } else {
                            pd.close();
                          }
                        });
                      } catch (e) {
                        pd.close();
                      }
                      pd.close();
                    }
                  });
                },
              );
            },
          ),
          const SizedBox(height: 24),
          const AttendanceSummaryCard(),
        ],
      ),
    );
  }
}
