import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/style/component/button/custom_button.dart';
import 'package:todo_window_app/style/resources/button_size.dart';
import 'package:todo_window_app/style/resources/icon_size.dart';
import 'package:todo_window_app/style/resources/palette.dart';

class CustomIconButton extends ConsumerWidget {
  const CustomIconButton({
    super.key,
    ButtonSize? width,
    ButtonSize? height,
    this.margin,
    IconSize? iconSize,
    bool? isDisabled,
    Color? backgroundColor,
    Color? hoverColor,
    Color? splashColor,
    Color? iconColor,
    required this.icon,
    required this.onPressed,
  })  : width = width ?? ButtonSize.small,
        height = height ?? ButtonSize.small,
        iconSize = iconSize ?? IconSize.medium,
        isDisabled = isDisabled ?? false,
        backgroundColor = backgroundColor ?? Palette.primary,
        hoverColor = hoverColor ?? Palette.primaryHover,
        splashColor = splashColor ?? Palette.primarySplash,
        iconColor = iconColor ?? Palette.onPrimary;

  final ButtonSize width;
  final ButtonSize height;
  final EdgeInsetsGeometry? margin;
  final bool isDisabled;
  final Color backgroundColor;
  final Color hoverColor;
  final Color splashColor;
  final IconData icon;
  final Color iconColor;
  final IconSize iconSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomButton(
      /// 호버, 스플래시
      hoverColor: hoverColor,
      splashColor: splashColor,

      /// 크기
      width: width,
      height: height,
      margin: margin,

      isDisabled: isDisabled,
      color: backgroundColor,
      onPressed: onPressed,
      child: Center(
        child: Icon(
          icon,
          color: isDisabled ? ref.theme.color.inactiveContainer : iconColor,
          size: iconSize.getSize(),
        ),
      ),
    );
  }
}
