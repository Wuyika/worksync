import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/attendance/cubits/attendance_summary_cubit.dart';
import 'package:worklin/pages/attendance/views/scan_qr_code.dart';
import 'package:worklin/pages/attendance/widgets/attendance_card.dart';
import 'package:worklin/pages/attendance/widgets/attendance_summary_card.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/enums.dart';
import 'package:worklin/utils/helpers.dart';

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
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          BlocBuilder<AttendanceSummaryCubit, AttendanceSummaryState>(
            builder: (context, state) {
              final cubit = context.read<AttendanceSummaryCubit>();
              return AttendanceCard(
                checkIn: () async {

                  String? code;
                  await AppNavigator.push(context, const ScanQrPage())
                      .then((value) {
                    if (value != null) {
                      code = value as String?;
                      cubit.updateIndex(AttendanceSummaryState.checkOut);
                      showDialogCard(
                        context,
                        titleText: LocaleKeys.check_in_successful.tr(),
                        actionText:  LocaleKeys.okay.tr(),
                        descriptionText: LocaleKeys.check_in_successful_desc.tr(),
                      ).then((value){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(code ?? "")),
                        );
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
                      cubit.updateIndex(AttendanceSummaryState.endOfDay);
                    }
                  });
                },
                state: cubit.state,
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
