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
    _storage.write(MyPreferencesConstants.lastCheckType, date);
  }

  static DateTime getLastSaveDay() {
    final DateTime date = _storage.read(MyPreferencesConstants.lastCheckType) ?? DateTime.now();
    return date;
  }

  static void saveLastType({required String type}) {
    _storage.write(MyPreferencesConstants.lastCheckType, type);
  }

  static String getLastType() {
    return _storage.read(MyPreferencesConstants.lastCheckType) ?? "";
  }

  static void saveLastCheckInTime({required TimeOfDay time}) {
    _storage.write(MyPreferencesConstants.lastCheckInTime, time);
  }

  static TimeOfDay? getLastCheckInTime() {
    final TimeOfDay? time = _storage.read(MyPreferencesConstants.lastCheckInTime);
    return time;
  }


  static void saveLastCheckOutTime({required TimeOfDay time}) {
    _storage.write(MyPreferencesConstants.lastCheckOutTime, time);
  }

  static TimeOfDay? getLastCheckOutTime() {
    final TimeOfDay? time = _storage.read(MyPreferencesConstants.lastCheckOutTime);
    return time;
  }

  static void saveTimesCheckOut({required int number}) {
    _storage.write(MyPreferencesConstants.timesCheckedOut, number);
  }

  static int getTimesCheckOut() {
    final int number = _storage.read(MyPreferencesConstants.timesCheckedOut) ?? 0;
    return number;
  }

}
