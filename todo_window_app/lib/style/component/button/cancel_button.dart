import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/style/component/button/custom_button.dart';
import 'package:todo_window_app/style/resources/button_size.dart';
import 'package:todo_window_app/style/resources/palette.dart';

class CancelButton extends ConsumerWidget {
  const CancelButton({
    super.key,
    ButtonSize? width,
    ButtonSize? height,
    this.margin,
    double? fontSize,
    bool? isDisabled,
    required this.title,
    required this.onPressed,
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
    return CustomButton(
      width: width,
      height: height,
      margin: margin,
      isDisabled: isDisabled,
      color: Palette.grey600,
      hoverColor: Palette.grey500,
      splashColor: Palette.grey400,
      onPressed: onPressed,
      child: Center(
        child: Text(
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
      ),
    );
  }
}
