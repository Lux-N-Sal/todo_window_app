import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/style/foundation/app_theme.dart';
import 'package:todo_window_app/style/theme/provider/theme_provider.dart';

extension ThemeServiceExt on WidgetRef {
  AppTheme get theme => watch(themeProvider);
  AppColor get color => theme.color;
  AppFont? get font => theme.font;
  ThemeData get themeData {
    return ThemeData(
        // 주색상 설정
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: theme.color.primary,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: theme.color.background,
          titleTextStyle: theme.font.headline1,
          iconTheme: IconThemeData(
            color: theme.color.text,
          ),
        ),
        scaffoldBackgroundColor: theme.color.surface,
        tabBarTheme: TabBarTheme(
          dividerColor: theme.color.surface,
          dividerHeight: 3,
        ),
        dialogBackgroundColor: theme.color.surface,
        dialogTheme: const DialogTheme(
          surfaceTintColor: Colors.transparent,
        ),
        unselectedWidgetColor: theme.color.background,
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(theme.color.bar),
          thickness: WidgetStateProperty.all(6),
          radius: const Radius.circular(3),
        ),
        checkboxTheme: CheckboxThemeData(
          splashRadius: 1,
          side: BorderSide(
            color: theme.color.boarderColor,
          ),
          checkColor: WidgetStateProperty.all(theme.color.background),
          fillColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return theme.color.text;
              } else if (states.contains(WidgetState.hovered)) {
                return theme.color.hoverColor;
              }
              return theme.color.container;
            },
          ),
        )
        // drawerTheme: DrawerThemeData(
        //   backgroundColor: theme.color.primary,
        //   elevation: 0,
        // ),
        );
  }
}
