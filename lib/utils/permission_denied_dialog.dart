import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:worklin/gen/translations/codegen_loader.g.dart';
import 'package:worklin/utils/typography.dart';

class PermissionDeniedDialog extends StatelessWidget {
  const PermissionDeniedDialog({
    super.key,
    required this.permissionMessage,
  });
  final String permissionMessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Center(
        child: Text(
          LocaleKeys.needPermission.tr(),
          style: AppTypography.bodyLargeMedium,
        ),
      ),
      content: Text(
        permissionMessage,
        style: AppTypography.bodyMediumRegular,
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            // Navigator.of(context).pop();
            openAppSettings();
          },
          child: Center(
            child: Text(
              LocaleKeys.goToSettings.tr(),
              style: const TextStyle(color: Colors.green),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
