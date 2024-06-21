class MyPreferencesConstants {
  MyPreferencesConstants._privateConstructor();
  static final MyPreferencesConstants _instance = MyPreferencesConstants._privateConstructor();
  static MyPreferencesConstants get instance => _instance;
  static const String currentUser = 'currentUser';
  static const String currentUserToken = 'currentUserToken';
  static const String onboardingShown = 'onboardingShown';
  static const String languageCode = 'languageCode';
  static const String timesCheckedOut = 'timesCheckedOut';
  static const String lastCheckDay = 'lastCheckDay';
  static const String lastCheckType = 'lastCheckType';
  static const String lastCheckInTime = 'lastCheckInTime';
  static const String lastCheckOutTime = 'lastCheckOutTime';
}
