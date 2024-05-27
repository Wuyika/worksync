import 'package:flutter/material.dart';
import 'package:worklin/pages/messages/models/message_models.dart';
import 'package:worklin/pages/messages/widget/chat/audio_message.dart';
import 'package:worklin/pages/messages/widget/chat/text_message.dart';
import 'package:worklin/pages/messages/widget/chat/video_message.dart';
import 'package:worklin/utils/colors.dart';

class Message extends StatelessWidget {
  final ChatMessage message;

  const Message({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    Widget messageContent(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
        case ChatMessageType.audio:
          return AudioMessage(message: message);
        case ChatMessageType.video:
          return VideoMessage(message: message);
        default:
          return const SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(
                Icons.person,
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(width: 8),
          ],
          messageContent(message),
          if (message.isSender) ...[
            const SizedBox(width: 8),
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(
                Icons.person,
                color: AppColors.secondary,
              ),
            ),
          ],
          // if (message.isSender) MessageStatusDot(status: message.messageStatus)
        ],
      ),
    );
  }
}
