import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/style/component/button/custom_outlined_button.dart';
import 'package:todo_window_app/style/resources/button_size.dart';

class OutlinedTextButton extends ConsumerWidget {
  const OutlinedTextButton({
    super.key,
    ButtonSize? width,
    ButtonSize? height,
    double? fontSize,
    bool? isDisabled,
    required this.title,
    required this.onPressed,
    this.margin,
  })  : width = width ?? ButtonSize.small,
        height = height ?? ButtonSize.small,
        fontSize = fontSize ?? 12,
        isDisabled = isDisabled ?? false;

  final ButtonSize width;
  final ButtonSize height;
  final EdgeInsetsGeometry? margin;
  final double fontSize;
  final bool isDisabled;
  final String title;
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
        child: Text(
          title,
          style: ref.theme.font.body2.copyWith(
            color: isDisabled
                ? ref.theme.color.onInactiveContainer
                : ref.theme.color.text,
            fontWeight: FontWeight.w600,
            fontSize: fontSize,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
