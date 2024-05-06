import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/style/component/button/custom_outlined_button.dart';
import 'package:todo_window_app/style/resources/button_size.dart';

class OutlinedIconButton extends ConsumerWidget {
  const OutlinedIconButton({
    super.key,
    ButtonSize? width,
    ButtonSize? height,
    this.margin,
    double? iconSize,
    bool? isDisabled,
    // Color? backgroundColor,
    // Color? hoverColor,
    // Color? splashColor,
    required this.icon,
    required this.onPressed,
  })  : width = width ?? ButtonSize.small,
        height = height ?? ButtonSize.small,
        iconSize = iconSize ?? 12,
        isDisabled = isDisabled ?? false;
  // backgroundColor = backgroundColor ?? Palette.primary,
  // hoverColor = hoverColor ?? Palette.primaryHover,
  // splashColor = splashColor ?? Palette.primarySplash;

  final ButtonSize width;
  final ButtonSize height;
  final EdgeInsetsGeometry? margin;
  final double iconSize;
  final bool isDisabled;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomOutlinedButton(
      hoverColor: ref.theme.color.hoverColor,
      splashColor: ref.theme.color.splashColor,
      borderColor:
          isDisabled ? ref.theme.color.inactiveBorder : ref.theme.color.text,

      /// 사이즈
      width: width,
      height: height,

      /// 마진
      margin: margin,

      /// 활성화 여부
      isDisabled: isDisabled,

      color: isDisabled ? ref.theme.color.inactive : ref.theme.color.background,
      onPressed: onPressed,
      child: Center(
        child: Icon(
          icon,
          color: ref.theme.color.text,
          size: iconSize,
        ),
      ),
    );
  }
}
