part of 'app_theme.dart';

enum AppMode {
  dark,
  light;

  static Map<String, dynamic> toJson(AppMode mode) {
    String modeString = mode.toString().split('.').last;
    return {'AppMode': modeString};
  }

  /// String을 enum AppMode 으로 만들어주는 static 함수
  static AppMode toEnum(String modeString) {
    try {
      return AppMode.values.firstWhere(
        (element) => element.getString() == modeString,
        orElse: () => AppMode.light,
      );
    } catch (e, s) {
      log("${e.toString()}\n${s.toString()}");
      return AppMode.light;
    }
  }

  String getString() {
    return toString().split('.').last;
  }

  AppTheme getTheme() {
    switch (this) {
      case AppMode.light:
        return LightTheme();
      case AppMode.dark:
        return DarkTheme();
    }
  }
}
