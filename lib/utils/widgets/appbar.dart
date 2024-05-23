import 'package:flutter/material.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final Widget? leading;
  final Widget? trailing;
  final String? title;
  final String? subtitle;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.leading,
    this.trailing,
    this.title,
    this.subtitle,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: (subtitle != null)
          ? ListTile(
              contentPadding: EdgeInsets.zero,
              title: Row(
                children: [
                  Text(
                    title ?? "",
                    style: AppTypography.headingH2,
                  ),
                ],
              ),
              subtitle: Text(
                subtitle ?? "",
                style: AppTypography.bodySmallRegular.copyWith(
                  color: AppColors.textColor.withOpacity(0.5),
                ),
              ),
              trailing: trailing,
            )
          : ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                title ?? "",
                style: AppTypography.headingH2,
              ),
              trailing: trailing,
            ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
