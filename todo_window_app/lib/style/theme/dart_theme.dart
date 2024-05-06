import 'package:todo_window_app/style/foundation/app_theme.dart';
import 'package:todo_window_app/style/resources/font.dart';
import 'package:todo_window_app/style/resources/palette.dart';

class DarkTheme implements AppTheme {
  @override
  AppMode mode = AppMode.dark;

  @override
  AppColor color = AppColor(
    surface: Palette.oneDarkSurface,
    background: Palette.oneDarkBackground,
    container: Palette.oneDarkContainer,
    text: Palette.oneDarkText,
    hint: Palette.grey500,
    hintContainer: Palette.oneDarkHintContainer,
    onHintContainer: Palette.oneDarkOnHintContainer,
    inactive: Palette.grey500,
    inactiveContainer: Palette.grey600,
    onInactiveContainer: Palette.grey400,
    inactiveBorder: Palette.grey550,
    primary: Palette.primary,
    onPrimary: Palette.white,
    selectedIconColor: Palette.oneDarkSelectIcon,
    unSelectedIconColor: Palette.oneDarkIcon,
    bar: Palette.oneDarkBar,
    titlebarButtonBackground: Palette.oneDarkContainer,
    titleBarButtonText: Palette.oneDarkText,
    titlebarButtonHover: Palette.grey600,
    titlebarButtonSplash: Palette.grey600.withOpacity(0.5),
    hoverColor: Palette.oneDarkHover,
    splashColor: Palette.oneDarkSplash,
    selectedTileColor: Palette.oneDarkBoarder.withOpacity(0.5),
    selectedBoarderColor: Palette.oneDarkSelectedBoarder,
    boarderColor: Palette.oneDarkBoarder,
    loginHover: Palette.oneDarkLoginHover,
    loginSplash: Palette.oneDarkLoginSplash,
    loginButton: Palette.oneDarkLoginButton,
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
