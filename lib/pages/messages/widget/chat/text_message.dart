import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worklin/pages/messages/models/message_models.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';

class TextMessage extends StatelessWidget {
  final ChatMessage? message;
  const TextMessage({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.6,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: (message!.isSender)
            ? const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
        color: (message!.isSender)
            ? AppColors.secondary
            : AppColors.backGroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (message!.isSender) ? "You" : "Wuyika",
            style: AppTypography.bodySmallRegular.copyWith(
              fontSize: 12,
              color: (message!.isSender)
                  ? AppColors.backGroundColor
                  : AppColors.textColor.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            message!.text,
            style: AppTypography.bodySmallRegular.copyWith(
              color: (message!.isSender) ? AppColors.white : AppColors.textColor,
            ),
          ),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "6:10 pm",
              style: AppTypography.bodySmallRegular.copyWith(
                fontSize: 12,
                color: (message!.isSender)
                    ? AppColors.backGroundColor
                    : AppColors.textColor,
                fontWeight: AppTypography.weightLight
              ),
            ),
          ),
        ],
      ),
    );
  }
}
