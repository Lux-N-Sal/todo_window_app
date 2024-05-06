import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/style/component/button/custom_button.dart';
import 'package:todo_window_app/style/resources/button_size.dart';
import 'package:todo_window_app/style/resources/palette.dart';

class CustomTextButton extends ConsumerWidget {
  const CustomTextButton({
    super.key,
    ButtonSize? width,
    ButtonSize? height,
    this.margin,
    double? fontSize,
    bool? isDisabled,
    Color? backgroundColor,
    Color? hoverColor,
    Color? splashColor,
    Color? textColor,
    required this.title,
    required this.onPressed,
    this.focusNode,
  })  : width = width ?? ButtonSize.small,
        height = height ?? ButtonSize.small,
        fontSize = fontSize ?? 12,
        isDisabled = isDisabled ?? false,
        backgroundColor = backgroundColor ?? Palette.primary,
        hoverColor = hoverColor ?? Palette.primaryHover,
        splashColor = splashColor ?? Palette.primarySplash,
        textColor = textColor ?? Palette.onPrimary;

  final ButtonSize width;
  final ButtonSize height;
  final EdgeInsetsGeometry? margin;
  final double fontSize;

  /// isDisabled값은 true가 되면 button이 disable된다.
  final bool isDisabled;
  final String title;
  final Color backgroundColor;
  final Color hoverColor;
  final Color splashColor;
  final Color textColor;
  final VoidCallback onPressed;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomButton(
      focusNode: focusNode,

      /// 호버, 클릭 색상 변경
      hoverColor: hoverColor,
      splashColor: splashColor,

      /// 사이즈
      width: width,
      height: height,

      /// 마진
      margin: margin,

      /// 활성화 여부
      isDisabled: isDisabled,

      color: backgroundColor,
      onPressed: onPressed,
      child: Center(
        child: Text(
          title,
          style: ref.theme.font.body2.copyWith(
            color: isDisabled ? ref.theme.color.onInactiveContainer : textColor,
            fontWeight: FontWeight.w600,
            fontSize: fontSize,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
