import 'package:flutter/material.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/pages/messages/models/message_models.dart';
import 'package:worklin/utils/colors.dart';

class VideoMessage extends StatelessWidget {
  final ChatMessage? message;
  const VideoMessage({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        color: AppColors.white,
        border: Border.all(
          color: (message!.isSender)
              ? AppColors.secondary
              : AppColors.backGroundColor,
          width: 6,
        ),
      ),
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.6,
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(Assets.appImages.avatar1.path),
            ),
            Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow,
                size: 16,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
