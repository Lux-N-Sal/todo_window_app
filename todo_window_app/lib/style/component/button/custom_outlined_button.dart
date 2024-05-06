import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/style/resources/button_size.dart';

class CustomOutlinedButton extends ConsumerWidget {
  const CustomOutlinedButton({
    super.key,
    ButtonSize? width,
    ButtonSize? height,
    this.margin,
    this.color,
    this.hoverColor,
    this.splashColor,
    this.borderColor,
    required this.onPressed,
    required this.child,
    this.isDisabled,
  })  : width = width ?? ButtonSize.small,
        height = height ?? ButtonSize.small;

  final ButtonSize width;
  final ButtonSize height;
  final EdgeInsetsGeometry? margin;
  final bool? isDisabled;
  final Color? color;
  final Color? hoverColor;
  final Color? splashColor;
  final Color? borderColor;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      cursor: isDisabled ?? false
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      child: IgnorePointer(
        ignoring: isDisabled ?? false,
        child: Container(
          width: width.getSize(),
          height: height.getSize(),
          margin: margin,
          decoration: BoxDecoration(
            color: color ?? ref.theme.color.background,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: borderColor ?? ref.theme.color.boarderColor,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              hoverColor: hoverColor ?? ref.theme.color.hoverColor,
              splashColor: splashColor ?? ref.theme.color.splashColor,
              hoverDuration: const Duration(microseconds: 100),

              /// 버튼이 Disalbed라면 null 반환
              onTap: isDisabled ?? false ? null : onPressed,
              borderRadius: BorderRadius.circular(5),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
