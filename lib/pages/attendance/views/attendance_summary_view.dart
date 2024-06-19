import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/attendance/cubits/attendance_cubit.dart';
import 'package:worklin/pages/attendance/views/scan_qr_code.dart';
import 'package:worklin/pages/attendance/widgets/attendance_card.dart';
import 'package:worklin/pages/attendance/widgets/attendance_summary_card.dart';
import 'package:worklin/utils/app_navigator.dart';
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
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 8, left: Sizes.size_8, right: Sizes.size_8),
      child: Column(
        children: [
          BlocBuilder<AttendanceCubit, AttendanceState>(
            builder: (context, state) {
              final cubit = context.read<AttendanceCubit>();
              return AttendanceCard(
                checkIn: () async {
                  String? code;
                  final pd = ProgressDialog(context: context);
                  cubit.requestLocationPermission().then((value) async {
                    if(value == true){
                      pd.show(msg: "Getting current location");
                      cubit.getLocation().then((value) async {
                        pd.close();
                        if(value == true){
                          await AppNavigator.push(context, const ScanQrPage())
                              .then((value) async {
                            if (value != null) {
                              code = value as String?;
                              pd.show(msg: "Getting company branch");
                              await cubit.fetchCompanyBranch().then((value)async{
                                if(value == true){
                                  pd.close();
                                  pd.show(msg: "Calculating distance");
                                  await cubit.calculateDistance().then((value){
                                    if(value == true){
                                      showDialogCard(
                                        context,
                                        titleText: LocaleKeys.check_in_successful.tr(),
                                        actionText:  LocaleKeys.okay.tr(),
                                        descriptionText: LocaleKeys.check_in_successful_desc.tr(),
                                      ).then((value){
                                        pd.close();
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text(code ?? "")),
                                        );
                                      });
                                    }
                                  });
                                } else {
                                  pd.close();
                                }
                              });

                            }
                          });
                        } else {
                          pd.close();
                        }
                      });

                    }
                  });
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
                      cubit.checkOut();
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
