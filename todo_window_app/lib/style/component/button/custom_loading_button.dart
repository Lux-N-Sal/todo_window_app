import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/style/resources/button_size.dart';

class CustomLoadingButton extends ConsumerWidget {
  const CustomLoadingButton({
    super.key,
    ButtonSize? width,
    ButtonSize? height,
    this.margin,
    this.inactiveColor,
    this.loadingColor,
  })  : width = width ?? ButtonSize.small,
        height = height ?? ButtonSize.small;

  final ButtonSize width;
  final ButtonSize height;
  final EdgeInsetsGeometry? margin;
  final Color? inactiveColor;
  final Color? loadingColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      cursor: SystemMouseCursors.forbidden,
      child: IgnorePointer(
        ignoring: true,
        child: Container(
          width: width.getSize(),
          height: height.getSize(),
          margin: margin,
          decoration: BoxDecoration(
            /// isDisabled 시 색 조정
            color: inactiveColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: SizedBox(
                width: ButtonSize.small.getSize(),
                height: ButtonSize.small.getSize(),
                child: CircularProgressIndicator(
                  color: loadingColor ?? ref.theme.color.onInactiveContainer,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
