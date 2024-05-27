import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:worklin/pages/messages/models/message_models.dart';
import 'package:worklin/pages/messages/widget/chat/message.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/custom_text_field.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  TextEditingController textEditingController = TextEditingController();

  List<ChatMessage> demoChatMessages = [
    ChatMessage(
      text: "How far are you  with the designs?",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.viewed,
      isSender: false,
    ),
    ChatMessage(
      text:
          "For now, I’m done with the previous pages I started with, this morning.",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.viewed,
      isSender: true,
    ),
    ChatMessage(
      text: "Hi, are you still working?",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.viewed,
      isSender: false,
    ),
    ChatMessage(
      text: "",
      messageType: ChatMessageType.audio,
      messageStatus: MessageStatus.viewed,
      isSender: true,
    ),
    ChatMessage(
      text: "",
      messageType: ChatMessageType.audio,
      messageStatus: MessageStatus.viewed,
      isSender: false,
    ),
    ChatMessage(
      text:
          "For now, I’m done with the previous pages I started with, this morning.",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.viewed,
      isSender: true,
    ),
    ChatMessage(
      text: "How far are you  with the designs?",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.viewed,
      isSender: false,
    ),
    ChatMessage(
      text:
          "For now, I’m done with the previous pages I started with, this morning.",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.viewed,
      isSender: true,
    ),
    ChatMessage(
      text: "How far are you  with the designs?",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.viewed,
      isSender: false,
    ),
    ChatMessage(
      text: "",
      messageType: ChatMessageType.audio,
      messageStatus: MessageStatus.viewed,
      isSender: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppBar(
            leading: TextButton(
              onPressed: () {
                AppNavigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
                size: 30,
              ),
            ),
            title: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(
                    Icons.person,
                    size: 32,
                    color: AppColors.white,
                  ),
                ),
              ),
              title: Text(
                "Francis Fon Teboh",
                style: AppTypography.headingH2.copyWith(
                  color: AppColors.white,
                ),
              ),
              subtitle: Text(
                "Active",
                style: AppTypography.bodySmallRegular.copyWith(
                  color: AppColors.activeGreen,
                ),
              ),
              trailing: const Icon(
                Icons.more_vert,
                color: AppColors.white,
                size: 30,
              ),
            ),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.secondary,
                    Colors.purple,
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.only(top: 120),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Today",
                      style: AppTypography.bodyLargeRegular.copyWith(
                        color: AppColors.textColor.withOpacity(0.5),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: demoChatMessages.length,
                      itemBuilder: (context, index) =>
                          Message(message: demoChatMessages[index]),
                    ),
                  ),
                  // Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: AppColors.inactive,
                        ),
                      ),
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: AppColors.secondary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ),
                        trailing: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: AppColors.secondary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            textEditingController.text.isEmpty
                                ? Icons.mic
                                : Icons.send,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ),
                        title: Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: "Type Message",
                                controller: textEditingController,
                                showBottomBorder: true,
                                showNoBorders: true,
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ),
                            SizedBox(
                              height: 28,
                              child: VerticalDivider(
                                color: AppColors.textColor.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
