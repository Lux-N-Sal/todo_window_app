import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/style/resources/button_size.dart';

class CustomCircleLoadingButton extends ConsumerWidget {
  const CustomCircleLoadingButton({
    super.key,
    ButtonSize? width,
    ButtonSize? height,
  })  : width = width ?? ButtonSize.small40,
        height = height ?? ButtonSize.small40;

  final ButtonSize width;
  final ButtonSize height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width.getSize(),
      height: height.getSize(),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ref.theme.color.background,
      ),
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: SizedBox(
              width: width.getSize(),
              height: height.getSize(),
              child: CircularProgressIndicator(
                strokeWidth: 7,
                color: ref.theme.color.text,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
