import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/style/component/button/custom_button.dart';
import 'package:todo_window_app/style/resources/button_size.dart';
import 'package:todo_window_app/style/resources/icon_size.dart';
import 'package:todo_window_app/style/resources/palette.dart';

class CustomIconTextButton extends ConsumerWidget {
  const CustomIconTextButton({
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
    required this.fontSize,
    required this.title,
    required this.onPressed,
  })  : width = width ?? ButtonSize.large,
        height = height ?? ButtonSize.large,
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
  final double fontSize;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomButton(
      width: width,
      height: height,
      margin: margin,
      isDisabled: isDisabled,
      color: backgroundColor,
      hoverColor: hoverColor,
      splashColor: splashColor,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isDisabled ? ref.theme.color.inactive : iconColor,
            size: iconSize.getSize(),
          ),
          Text(
            title,
            style: ref.theme.font.body2.copyWith(
              color: isDisabled
                  ? ref.theme.color.inactiveContainer
                  : ref.theme.color.onPrimary,
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  CustomIconTextButton copyWith({
    ButtonSize? width,
    ButtonSize? height,
    ValueGetter<EdgeInsetsGeometry?>? margin,
    bool? isDisabled,
    Color? backgroundColor,
    Color? hoverColor,
    Color? splashColor,
    IconData? icon,
    Color? iconColor,
    IconSize? iconSize,
    double? fontSize,
    String? title,
    VoidCallback? onPressed,
  }) {
    return CustomIconTextButton(
      width: width ?? this.width,
      height: height ?? this.height,
      margin: margin != null ? margin() : this.margin,
      isDisabled: isDisabled ?? this.isDisabled,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      hoverColor: hoverColor ?? this.hoverColor,
      splashColor: splashColor ?? this.splashColor,
      icon: icon ?? this.icon,
      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,
      fontSize: fontSize ?? this.fontSize,
      title: title ?? this.title,
      onPressed: onPressed ?? this.onPressed,
    );
  }
}
