import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/enums.dart';
import 'package:worklin/utils/widgets/dialog_card.dart';

void hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

Future<dynamic> showDialogCard(
  BuildContext context, {
  required String titleText,
  required String actionText,
  String? descriptionText,
  DialogType dialogType = DialogType.success,
  bool isDismissible = true,
  VoidCallback? mainAction,
  VoidCallback? warningAction,
}) async {
  final value = await showDialog(
    barrierDismissible: isDismissible,
    context: context,
    builder: (context) => DialogCardWidget(
      dialogType: dialogType,
      titleText: titleText,
      actionText: actionText,
      descriptionText: descriptionText,
    ),
  );
  return value;
}

Future<DateTime?> showDatePickerCustom(
  BuildContext context, {
  required DateTime firstDate,
  required DateTime lastDate,
  DateTime? currentDate,
}) async {
  return await showDialog<DateTime>(
    context: context,
    builder: (context) {
      return Theme(
        data: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? ThemeData.dark(useMaterial3: true).copyWith(
                colorScheme: const ColorScheme.dark(
                  onPrimary: AppColors.white,
                  surface: AppColors.primary,
                  primary: AppColors.secondary,
                ),
              )
            : ThemeData.light(useMaterial3: true).copyWith(
                colorScheme: const ColorScheme.light(
                  onSurface: AppColors.primary,
                  primary: AppColors.secondary,
                  surfaceTint: AppColors.secondary,
                ),
              ),
        child: DatePickerDialog(
          firstDate: firstDate,
          lastDate: lastDate,
          currentDate: currentDate,
          // helpText: "hgsgete",
        ),
      );
    },
  );
}

final timeFormat = DateFormat("H:mm");
final dateFormat = DateFormat("EEE, MMM d, yyyy");
