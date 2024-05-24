import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/pages/messages/view/chart_page.dart';
import 'package:worklin/utils/app_navigator.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';

class MessageTile extends StatelessWidget {
  final bool hasUnread;
  final bool hasSent;

  const MessageTile({
    super.key,
    this.hasUnread = false,
    this.hasSent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              onTap: (){
                AppNavigator.push(context, const ChartPage());
              },
              contentPadding: EdgeInsets.zero,
              leading: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.secondary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(
                    Icons.person,
                    size: 32,
                    color: AppColors.secondary,
                  ),
                ),
              ),
              title: Text(
                "Francis Fon Teboh",
                style: AppTypography.bodySmallSemiBold,
              ),
              subtitle: Text(
                "Hi are you still working? ",
                style: AppTypography.bodySmallRegular.copyWith(
                  color: AppColors.textColor.withOpacity(0.6),
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "10 mins",
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.textColor.withOpacity(0.6),
                    ),
                  ),
                  if (hasUnread)
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "2",
                        style: AppTypography.bodySmallSemiBold.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    )
                  else if (hasSent)
                    SvgPicture.asset(Assets.appIcons.svg.doubleChecksFill),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
