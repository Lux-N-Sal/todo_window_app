import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/style/resources/button_padding.dart';
import 'package:todo_window_app/style/resources/button_size.dart';

class CustomShadowButton extends ConsumerWidget {
  const CustomShadowButton({
    super.key,
    required this.width,
    required this.height,
    required this.margin,
    required this.isDisabled,
    required this.color,
    required this.hoverColor,
    required this.splashColor,
    required this.onPressed,
    required this.child,
    this.focusNode,
    required this.shadowColor,
  });

  final ButtonSize width;
  final ButtonSize height;
  final ButtonPadding margin;
  final bool isDisabled;
  final Color color;
  final Color hoverColor;
  final Color splashColor;
  final VoidCallback onPressed;
  final Widget child;
  final FocusNode? focusNode;
  final Color shadowColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      cursor:
          isDisabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
      child: IgnorePointer(
        ignoring: isDisabled,
        child: Container(
          width: width.getSize(),
          height: height.getSize(),
          margin: EdgeInsets.all(
            margin.getPadding() * 0.75,
          ),
          decoration: BoxDecoration(
            /// isDisabled 시 색 조정
            color: isDisabled ? ref.theme.color.inactive : color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 3,
                spreadRadius: 1,
                blurStyle: BlurStyle.solid,
              )
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              focusNode: focusNode,
              hoverColor: hoverColor,
              splashColor: splashColor,
              focusColor: color,
              hoverDuration: const Duration(microseconds: 100),

              /// 버튼이 Disalbed라면 null 반환
              onTap: isDisabled ? null : onPressed,
              borderRadius: BorderRadius.circular(10),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
