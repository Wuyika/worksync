import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:worklin/pages/messages/widget/message_tile.dart';
import 'package:worklin/pages/messages/widget/no_message_widget.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';
import 'package:worklin/utils/widgets/custom_text_field.dart';
import 'package:worklin/utils/widgets/gradient_container.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  TextEditingController searchController = TextEditingController();
  bool noMessage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: noMessage == true
          ? NoMessageWidget(
              setChart: () {
                setState(() {
                  noMessage = false;
                });
              },
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 48,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            filled: true,
                            prefix: const Icon(Icons.search),
                            hintText: "Search...",
                            controller: searchController,
                          ),
                        ),
                        const SizedBox(width: 32),
                        PopupMenuButton(
                          iconSize: 27,
                          surfaceTintColor: AppColors.white,
                          position: PopupMenuPosition.under,
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
                                  "All Chats",
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
                                  tr('Unread'),
                                  style: AppTypography.bodySmallMedium.copyWith(
                                    color: AppColors.selector,
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                onTap: () {},
                                child: Text(
                                  tr('Archived'),
                                  style: AppTypography.bodySmallMedium.copyWith(
                                    color: AppColors.selector,
                                  ),
                                ),
                              ),
                            ];
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      // shrinkWrap: true,
                      children: const [
                        MessageTile(hasUnread: true),
                        MessageTile(hasSent: true),
                        MessageTile(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: noMessage == true
          ? null
          : InkWell(
              onTap: () {
                // AppNavigator.push(context, const ApplyForLeavePage());
              },
              child: GradientContainer(
                width: 48,
                height: 48,
                borderRadius: BorderRadius.circular(10),
                child: const Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
              ),
            ),
    );
  }
}
