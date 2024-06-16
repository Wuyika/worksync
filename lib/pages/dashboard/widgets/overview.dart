import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/sizes.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/gradient_container.dart';

class DashboardOverview extends StatelessWidget {
  const DashboardOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Sizes.size_12, horizontal: Sizes.size_12),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.inactive.withOpacity(0.8),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  LocaleKeys.overview.tr(),
                  style: AppTypography.bodyLargeMedium.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(width: Sizes.size_2),
              SizedBox(
                height: 32,
                child: PopupMenuButton(
                  surfaceTintColor: AppColors.white,
                  position: PopupMenuPosition.under,
                  color: AppColors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.white,
                    ),
                    child: Row(
                      children: [
                        Text(
                          LocaleKeys.this_month.tr(),
                          style: AppTypography.bodySmallMedium.copyWith(
                            color: AppColors.selector,
                          ),
                        ),
                        const Icon(
                          size: 28,
                          Icons.arrow_drop_down,
                          color: AppColors.selector,
                        ),
                      ],
                    ),
                  ),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        onTap: () {},
                        child: Text(
                          LocaleKeys.this_year.tr(),
                          style: AppTypography.bodySmallMedium.copyWith(
                            color: AppColors.selector,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {},
                        child: Text(
                          LocaleKeys.last_month.tr(),
                          style: AppTypography.bodySmallMedium.copyWith(
                            color: AppColors.selector,
                          ),
                        ),
                      ),
                    ];
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: Sizes.size_16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size_16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      LocaleKeys.presence.tr(),
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      "06",
                      style: AppTypography.bodySmallSemiBold.copyWith(
                        color: AppColors.white,
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                  child: VerticalDivider(
                    color: AppColors.white,
                    thickness: 1.5,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      LocaleKeys.absence.tr(),
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      "03",
                      style: AppTypography.bodySmallSemiBold.copyWith(
                        color: AppColors.white,
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                  child: VerticalDivider(
                    color: AppColors.white,
                    thickness: 1.5,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      LocaleKeys.lateness.tr(),
                      style: AppTypography.bodySmallRegular.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      "1hr",
                      style: AppTypography.bodySmallSemiBold.copyWith(
                        color: AppColors.white,
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: Sizes.size_16),
          Container(
            padding:
                EdgeInsets.symmetric(vertical: 12, horizontal: Sizes.size_8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Today, Mon 08 Apr, 2024",
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(Sizes.size_8),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${LocaleKeys.checked_in.tr()}:",
                                style:
                                    AppTypography.bodyExtraSmallMedium.copyWith(
                                  color: AppColors.textColor.withOpacity(0.5),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "08:01 AM",
                                      style:
                                          AppTypography.bodyExtraSmallMedium.copyWith(
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset(Assets.appIcons.svg.checkin),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  "1 min late",
                                  style: AppTypography.bodyExtraSmallRegular
                                      .copyWith(
                                    color: AppColors.white,
                                    fontSize: Sizes.size_12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: Sizes.size_8),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(Sizes.size_8),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${LocaleKeys.check_out.tr()}:",
                                style:
                                    AppTypography.bodyExtraSmallMedium.copyWith(
                                  color: AppColors.textColor.withOpacity(0.5),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "__:__ PM",
                                      style:
                                          AppTypography.bodyExtraSmallMedium.copyWith(
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset(Assets.appIcons.svg.checkin),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.warning,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  LocaleKeys.check_out.tr(),
                                  style: AppTypography.bodyExtraSmallRegular
                                      .copyWith(
                                    color: AppColors.white,
                                    fontSize: Sizes.size_12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: Sizes.size_8),
                      Expanded(
                        child: GradientContainer(
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizes.size_6,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  LocaleKeys.total_hours.tr(),
                                  style: AppTypography.bodyExtraSmallMedium
                                      .copyWith(
                                    color: AppColors.white,
                                    fontSize: Sizes.size_12,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "2hr 45m",
                                  style: AppTypography.bodyLargeMedium.copyWith(
                                    color: AppColors.white,
                                    fontWeight: AppTypography.weightSemiBold,
                                    fontSize: Sizes.size_16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
