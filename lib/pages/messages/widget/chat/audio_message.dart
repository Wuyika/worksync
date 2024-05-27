import 'package:flutter/material.dart';
import 'package:worklin/pages/messages/models/message_models.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';

class AudioMessage extends StatelessWidget {
  final ChatMessage? message;

  const AudioMessage({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.6,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: (message!.isSender)
            ? const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
        color: (message!.isSender)
            ? AppColors.secondary
            : AppColors.backGroundColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.play_arrow,
                color: message!.isSender ? AppColors.white : AppColors.secondary,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20 / 2),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      //linear indicator
                      Container(
                        width: double.infinity,
                        height: 2.5,
                        color: message!.isSender
                            ? Colors.white
                            : AppColors.secondary,
                      ),
                      Positioned(
                        left: 0,
                        child: Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            color: message!.isSender
                                ? AppColors.white
                                : AppColors.secondary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "0.37",
                style: AppTypography.bodySmallRegular.copyWith(
                  color: (message!.isSender)
                      ? AppColors.white
                      : AppColors.textColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 1),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "6:10 pm",
              style: AppTypography.bodySmallRegular.copyWith(
                fontSize: 12,
                color: (message!.isSender)
                    ? AppColors.backGroundColor
                    : AppColors.textColor,
                fontWeight: AppTypography.weightLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
