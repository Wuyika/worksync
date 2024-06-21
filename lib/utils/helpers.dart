import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:worklin/utils/app_alert.dart';
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
final dateFormat = DateFormat("EEE, d MMM yyyy");


String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email cannot be empty';
  }
// Regular expression for email validation
  const pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}

int? extractNumber(String inputString) {
  RegExp regExp = RegExp(r'/(\d+)$');

  final match = regExp.firstMatch(inputString);

  if (match != null) {
    return int.parse(match.group(1)!); // The '!' asserts that the value is not null
  } else {
    AppAlerts.showErrorSnackBar('In Valid QR');
    return null;
  }
}

String formatDuration(TimeOfDay t1, TimeOfDay t2) {
  final now = DateTime.now();
  final dt1 = DateTime(now.year, now.month, now.day, t1.hour, t1.minute);
  final dt2 = DateTime(now.year, now.month, now.day, t2.hour, t2.minute);
  final duration = dt2.difference(dt1);

  String formattedDuration = "";
  if (duration.inHours > 0) {
    formattedDuration += "${duration.inHours}hr";
    if (duration.inMinutes.remainder(60) > 0) {
      formattedDuration += "${duration.inMinutes.remainder(60)}";
    }
  } else if (duration.inMinutes > 0) {
    formattedDuration += "${duration.inMinutes}min";
  } else if (duration.inSeconds > 0) {
    formattedDuration += "${duration.inSeconds}s";
  }
  return formattedDuration;
}
