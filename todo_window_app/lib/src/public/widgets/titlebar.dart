import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';

class TitleBar extends ConsumerWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonColors = WindowButtonColors(
      iconNormal: ref.theme.color.titleBarButtonText,
      mouseOver: ref.theme.color.titlebarButtonHover,
      mouseDown: ref.theme.color.titlebarButtonSplash,
      iconMouseDown: ref.theme.color.titleBarButtonText,
      iconMouseOver: ref.theme.color.titleBarButtonText,
    );

    final closeButtonColors = WindowButtonColors(
      iconNormal: ref.theme.color.titleBarButtonText,
      mouseOver: Colors.red,
      mouseDown: Colors.red.withOpacity(0.5),
      iconMouseDown: ref.theme.color.titleBarButtonText,
      iconMouseOver: ref.theme.color.titleBarButtonText,
    );
    return WindowTitleBarBox(
      child: Row(
        children: [
          Expanded(child: MoveWindow()),
          Row(
            children: [
              /// 최소화 버튼
              MinimizeWindowButton(
                colors: buttonColors,
              ),

              appWindow.isMaximized
                  ? RestoreWindowButton(
                      colors: buttonColors,
                      onPressed: () {
                        appWindow.maximizeOrRestore();
                      },
                    )
                  : MaximizeWindowButton(
                      colors: buttonColors,
                      onPressed: () {
                        appWindow.maximizeOrRestore();
                      },
                    ),
              CloseWindowButton(colors: closeButtonColors),
            ],
          ),
        ],
      ),
    );
  }
}
