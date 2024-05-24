import 'package:flutter/material.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/typography.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final Widget? leading;
  final Widget? title;
  final String? subtitle;
  final List<Widget>? actions;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.actions,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      surfaceTintColor: AppColors.white,
      leading: leading,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
