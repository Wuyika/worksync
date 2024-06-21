import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/pages/attendance/cubits/attendance_cubit.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/helper_classes.dart';
import 'package:worklin/utils/helpers.dart';
import 'package:worklin/utils/sizes.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/button.dart';
import 'package:worklin/utils/widgets/real_time_clock.dart';

class AttendanceCard extends StatelessWidget {
  final VoidCallback checkIn;
  final VoidCallback checkOut;

  const AttendanceCard({
    super.key,
    required this.checkIn,
    required this.checkOut,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceCubit, AttendanceState>(
      builder: (context, state) {
        final cubit = context.read<AttendanceCubit>();
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  (state is AttendanceCheckOutState)
                      ? LocaleKeys.mark_attendance.tr()
                      : (state is AttendanceEndDayState)
                          ? LocaleKeys.end_of_day.tr()
                          : LocaleKeys.make_attendance.tr(),
                  style: AppTypography.bodyLargeMedium,
                ),
              ),
              const SizedBox(height: 2),
              const RealTimeClock(),
              const SizedBox(height: 4),
              Text(
                dateFormat.format(DateTime.now()),
                style: AppTypography.bodySmallMedium.copyWith(
                  color: AppColors.textColor.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 16),
              if (state is AttendanceCheckOutState)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width / 6,
                  ),
                  child: PrimaryOutlinedButton(
                    onPress: checkOut,
                    buttonText: LocaleKeys.check_out.tr(),
                  ),
                )
              else if (state is AttendanceEndDayState)
                Image.asset(Assets.appImages.attenanceCheckout.path)
              else
                InkWell(
                  onTap: checkIn,
                  child: Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 6,
                        color: AppColors.white.withOpacity(0.85),
                      ),
                    ),
                    child: Text(
                      LocaleKeys.check_in.tr(),
                      style: AppTypography.bodySmallMedium.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 16),
              if (state is AttendanceCheckOutState ||
                  state is AttendanceEndDayState)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.size_16),
                  child: Column(
                    children: [
                      const SizedBox(height: 2),
                      Divider(
                        color: AppColors.textColor.withOpacity(0.2),
                        thickness: 1.5,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                SvgPicture.asset(Assets.appIcons.svg.clockTime),
                                const SizedBox(height: 4),
                                Text(
                                  cubit.checkInTime != null
                                      ? cubit.checkInTime!.format(context)
                                      : "__:__ __",
                                  style: AppTypography.bodyMediumMedium,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  LocaleKeys.check_in.tr(),
                                  style:
                                      AppTypography.bodySmallSemiBold.copyWith(
                                    color: AppColors.textColor.withOpacity(0.5),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 28,
                            child: VerticalDivider(
                              color: AppColors.textColor.withOpacity(0.5),
                              thickness: 1.5,
                              width: Sizes.size_2,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                    Assets.appIcons.svg.timerRound),
                                const SizedBox(height: 4),
                                Text(
                                  cubit.checkOutTime != null
                                      ? cubit.checkOutTime!.format(context)
                                      : "__:__ __",
                                  style: AppTypography.bodyMediumMedium,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  LocaleKeys.check_out.tr(),
                                  style:
                                      AppTypography.bodySmallSemiBold.copyWith(
                                    color: AppColors.textColor.withOpacity(0.5),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 28,
                            child: VerticalDivider(
                              color: AppColors.textColor.withOpacity(0.5),
                              thickness: 1.5,
                              width: Sizes.size_2,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                SvgPicture.asset(Assets.appIcons.svg.timer),
                                const SizedBox(height: 4),
                                Text(
                                  cubit.duration != null
                                      ? cubit.duration!
                                      : "00",
                                  style: AppTypography.bodyMediumMedium,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  LocaleKeys.total_hours.tr(),
                                  style:
                                      AppTypography.bodySmallSemiBold.copyWith(
                                    color: AppColors.textColor.withOpacity(0.5),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              else
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    LocaleKeys.check_in_description.tr(),
                    style: AppTypography.bodySmallMedium,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
