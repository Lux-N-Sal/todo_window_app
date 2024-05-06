import 'package:todo_window_app/style/foundation/app_theme.dart';
import 'package:todo_window_app/style/resources/font.dart';
import 'package:todo_window_app/style/resources/palette.dart';

class LightTheme implements AppTheme {
  @override
  AppMode mode = AppMode.light;

  @override
  AppColor color = AppColor(
    surface: Palette.grey150,
    background: Palette.white,
    container: Palette.grey200,
    text: Palette.grey750,
    hint: Palette.grey500,
    hintContainer: Palette.grey200,
    onHintContainer: Palette.grey500,
    inactive: Palette.grey300,
    inactiveContainer: Palette.grey300,
    onInactiveContainer: Palette.grey200,
    inactiveBorder: Palette.grey375,
    primary: Palette.primary,
    onPrimary: Palette.white,
    selectedIconColor: Palette.grey800,
    unSelectedIconColor: Palette.grey400,
    bar: Palette.grey400,
    titlebarButtonBackground: Palette.grey750,
    titleBarButtonText: Palette.grey200,
    titlebarButtonHover: Palette.grey600,
    titlebarButtonSplash: Palette.grey600.withOpacity(0.5),
    hoverColor: Palette.grey300,
    splashColor: Palette.grey350,
    selectedTileColor: Palette.grey325.withOpacity(0.7),
    selectedBoarderColor: Palette.lightSelectedBoarder,
    boarderColor: Palette.grey375,
    loginButton: Palette.grey750,
    loginHover: Palette.lightLoginHover,
    loginSplash: Palette.lightLoginSplash,
    warningBoard: Palette.warningBoard,
    successBoard: Palette.successBoard,
    selectSuccessBoard: Palette.selectSuccessBoard,
    selectWarningBoard: Palette.selectWarningBoard,
  );

  @override
  late AppFont font = AppFont(
    font: const NotoSans(),
    fontColor: color.text,
    hintColor: color.hint,
  );
}
