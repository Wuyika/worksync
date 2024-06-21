import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:worklin/models/user_model.dart';
import 'package:worklin/providers/app_data.dart';
import 'package:worklin/utils/app_constants.dart';
class MyPref {
  static final _storage = GetStorage();

  MyPref._();

  static void updateUserInfo(UserModel user) {
    _storage.write(
      MyPreferencesConstants.currentUser,
      user.toJson(),
    );
  }

  static UserModel? getCurrentUser() {
    final savedValue = _storage.read(MyPreferencesConstants.currentUser);
    if (savedValue != null) {
      final user = UserModel.fromJson(savedValue as Map<String, dynamic>);
      AppData.updateCurrentUser(
        user: user,
        isNeedToStoreIntoStorage: false,
      );
      return user;
    }
    return null;
  }

  static void logOutUser() {
    AppData.clearAppData();
    _storage.remove(MyPreferencesConstants.currentUser);
    _storage.remove(MyPreferencesConstants.currentUserToken);
    _storage.remove(MyPreferencesConstants.timesCheckedOut);
    _storage.remove(MyPreferencesConstants.lastCheckDay);
    _storage.remove(MyPreferencesConstants.lastCheckType);
    _storage.remove(MyPreferencesConstants.lastCheckInTime);
    _storage.remove(MyPreferencesConstants.lastCheckOutTime);
  }

  static void markOnboardingAsShown() {
    _storage.write(MyPreferencesConstants.onboardingShown, true);
  }

  static bool hasOnboardingBeenShown() {
    return _storage.read(MyPreferencesConstants.onboardingShown) ?? false;
  }

  static void saveLocaleCode({required String locale}) {
    _storage.write(MyPreferencesConstants.languageCode, locale);
  }

  static String getLocaleCode() {
    return _storage.read(MyPreferencesConstants.languageCode) ?? "en";
  }

  static void saveLastDay({required DateTime date}) {
    _storage.write(MyPreferencesConstants.lastCheckDay, date.toIso8601String());
  }

  static DateTime? getLastSaveDay() {
    final String? stringDate = _storage.read(MyPreferencesConstants.lastCheckDay);
    final DateTime? date = DateTime.tryParse(stringDate ?? "");
    return date;
  }

  static void saveLastType({required String type}) {
    _storage.write(MyPreferencesConstants.lastCheckType, type);
  }

  static String getLastType() {
    return _storage.read(MyPreferencesConstants.lastCheckType) ?? "";
  }

  static void saveLastCheckInTime({required TimeOfDay time}) {
    final String timeString = '${time.hour}:${time.minute}';
    _storage.write(MyPreferencesConstants.lastCheckInTime, timeString);
  }

  static TimeOfDay? getLastCheckInTime() {
    final String? timeString = _storage.read(MyPreferencesConstants.lastCheckInTime);
    if(timeString != null){
      final parts = timeString.split(':');
      if (parts.length == 2) {
        return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
      }
    }
    return null;
  }


  static void saveLastCheckOutTime({required TimeOfDay time}) {
    final String timeString = '${time.hour}:${time.minute}';
    _storage.write(MyPreferencesConstants.lastCheckOutTime, timeString);
  }

  static TimeOfDay? getLastCheckOutTime() {
    final String? timeString = _storage.read(MyPreferencesConstants.lastCheckOutTime);
    if(timeString != null){
      final parts = timeString.split(':');
      if (parts.length == 2) {
        return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
      }
    }
    return null;
  }

  static void saveTimesCheckOut({required int number}) {
    _storage.write(MyPreferencesConstants.timesCheckedOut, number);
  }

  static int getTimesCheckOut() {
    final int number = _storage.read(MyPreferencesConstants.timesCheckedOut) ?? 0;
    return number;
  }

}
