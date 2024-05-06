import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';

class InfoDialog extends ConsumerWidget {
  const InfoDialog({
    Key? key,
    required this.controller,
    this.title,
    required this.height,
    required this.width,
    required this.content,
    this.actions,
    this.backgroundColor,
  }) : super(key: key);

  final FlashController<Object?> controller;
  // final String? title;
  final Widget? title;
  final double height;
  final double width;
  final Widget content;
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FadeTransition(
      opacity: controller.controller,
      child: AlertDialog(
        /// 배경 색
        backgroundColor: backgroundColor ?? ref.theme.color.background,

        /// 박스 모양
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          side: BorderSide(
            color: ref.theme.color.boarderColor,
          ),
        ),

        /// 타이틀
        title: title,

        // Text(
        //     title!,
        //     style: ref.theme.font.headline4,
        //     textAlign: TextAlign.center,
        //   ),

        /// content
        content: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.only(left: 5),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: content,
        ),

        /// 액션 버튼
        actions: actions,
      ),
    );
  }
}
