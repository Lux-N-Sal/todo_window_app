import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';

class CustomTitleButton extends ConsumerWidget {
  const CustomTitleButton({
    Key? key,
    required this.onTap,
    required this.hoverColor,
    required this.splashColor,
    required this.icon,
  }) : super(key: key);

  final void Function() onTap;
  final Color hoverColor;
  final Color splashColor;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        width: 23,
        height: 23,
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          // color: Palette.titleBarButtonColor,
          color: ref.theme.color.titlebarButtonBackground,
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              splashColor: splashColor,
              hoverColor: hoverColor,
              hoverDuration: const Duration(milliseconds: 100),
              child: Align(
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  color: ref.theme.color.titleBarButtonText,
                  size: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
