import 'package:worklin/pages/auth/models/user_model.dart';
import 'package:worklin/utils/my_pref.dart';

class AppData {
  AppData._();

  static UserModel? _user;
  static String? _token;

  static UserModel? get currentUser => _user;

  static String? get token => _token;

  static void updateCurrentUser({
    required UserModel user,
    bool isNeedToStoreIntoStorage = true,
  }) {
    _user = user;
    _token = user.token;
    if (isNeedToStoreIntoStorage) {
      MyPref.updateUserInfo(user);
    }
  }

  static void clearAppData() {
    _user = null;
    _token = null;
  }
}
