import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/globals.dart';

class AppAlerts {
  AppAlerts._();

  static void showErrorSnackBar([String? message]) {
    if (navigatorKey.currentState?.overlay != null) {
      DelightToastBar(
        autoDismiss: true,
        position: DelightSnackbarPosition.top,
        builder: (context) => ToastCard(
          color: AppColors.warning,
          leading: const Icon(
            Icons.error,
            size: 28,
            color: Colors.white,
          ),
          title: Text(
            message ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ).show(navigatorKey.currentState!.context);
    }
  }
  static void showInfoSnackBar([String? message]) {
    if (navigatorKey.currentState?.overlay != null) {
      DelightToastBar(
        autoDismiss: true,
        position: DelightSnackbarPosition.top,
        builder: (context) => ToastCard(
          color: AppColors.orange,
          leading: const Icon(
            Icons.info,
            size: 28,
            color: Colors.white,
          ),
          title: Text(
            message ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: AppColors.white,
            ),
          ),
        ),
      ).show(navigatorKey.currentState!.context);
    }
  }
}
