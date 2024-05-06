import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/style/foundation/app_theme.dart';
import 'package:todo_window_app/style/theme/dart_theme.dart';
import 'package:todo_window_app/style/theme/light_theme.dart';

part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  @override
  AppTheme build() {
    final AppThemeState appThemeState =
        AppThemeState.getInstance(appTheme: DarkTheme());
    return appThemeState.appTheme;
  }

  void toggleTheme() {
    state = state.mode == AppMode.light ? DarkTheme() : LightTheme();
  }
}

class AppThemeState {
  AppTheme appTheme;
  static AppThemeState? _instance;

  AppThemeState._privateConstructor({
    required this.appTheme,
  });

  static AppThemeState getInstance({
    required AppTheme? appTheme,
  }) {
    _instance ??= AppThemeState._privateConstructor(
      appTheme: appTheme!,
    );
    return _instance!;
  }

  void updateApptheme({required AppTheme newAppTheme}) {
    appTheme = newAppTheme;
  }
}
