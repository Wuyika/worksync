import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';

class TaskTile extends StatefulWidget {
  final double progress;
  final bool isRecent;

  const TaskTile({
    super.key,
    required this.progress,
    this.isRecent = false,
  });

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: widget.isRecent != true ? AppColors.white : AppColors.inactive.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Design the landing page for WORKSYNC",
                  style: AppTypography.bodySmallSemiBold,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.more_vert,
                color: AppColors.textColor,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "Design a landing page that talks for WORKSYNC as a software product.... ",
            style: AppTypography.bodySmallRegular,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  color: widget.progress == 100
                      ? AppColors.green_1
                      : AppColors.secondary,
                  backgroundColor: AppColors.inactive.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                  minHeight: 8,
                  value: widget.progress / 100,
                ),
              ),
              const SizedBox(width: 8),
              if (widget.progress != 100)
                Text(
                  "${widget.progress}%",
                  style: AppTypography.bodySmallRegular,
                )
              else
                Text(
                  LocaleKeys.completed.tr(),
                  style: AppTypography.bodySmallRegular.copyWith(
                    color: AppColors.green_1,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Divider(
            color: AppColors.inactive.withOpacity(0.5),
            thickness: 1.2,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                child: Icon(Icons.person),
              ),
              const Spacer(),
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.appIcons.svg.calendarOutline,
                    colorFilter: ColorFilter.mode(
                      AppColors.textColor.withOpacity(0.5),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '03 Apr, 2024',
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.textColor.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
