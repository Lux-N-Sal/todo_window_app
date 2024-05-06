import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/style/resources/button_size.dart';

class CustomCircleButton extends ConsumerWidget {
  const CustomCircleButton({
    super.key,
    ButtonSize? width,
    ButtonSize? height,
    required this.icon,
    required this.onPressed,
  })  : width = width ?? ButtonSize.small40,
        height = height ?? ButtonSize.small40;

  final ButtonSize width;
  final ButtonSize height;
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width.getSize(),
      height: height.getSize(),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ref.theme.color.surface,
      ),
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            hoverColor: ref.theme.color.hoverColor,
            onTap: onPressed,
            child: Icon(
              icon,
              color: ref.theme.color.text,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
