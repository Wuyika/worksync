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

}
