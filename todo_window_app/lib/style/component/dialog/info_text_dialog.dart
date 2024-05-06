import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/style/component/button/cancel_button.dart';
import 'package:todo_window_app/style/component/button/custom_text_button.dart';
import 'package:todo_window_app/style/component/dialog/info_dialog.dart';
import 'package:todo_window_app/style/resources/button_size.dart';

class InfoTextDialog extends ConsumerWidget {
  const InfoTextDialog({
    super.key,
    required this.controller,
    required this.height,
    required this.title,
    required this.content,
    required this.noTitle,
    required this.yesTitle,
    required this.noOnpressed,
    required this.yesOnpressed,
  });

  final FlashController<Object?> controller;
  final double height;
  final String title;
  final String content;
  final String noTitle;
  final String yesTitle;
  final void Function() noOnpressed;
  final void Function() yesOnpressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InfoDialog(
      controller: controller,
      title: Text(
        title,
        style: ref.theme.font.headline4,
        textAlign: TextAlign.center,
      ),
      height: height,
      width: 300,
      content: Column(
        children: [
          Text(
            content,
            style: ref.theme.font.body1,
          ),
        ],
      ),
      actions: [
        /// 취소 버튼
        CancelButton(
          width: ButtonSize.veryLarge,
          height: ButtonSize.small40,
          title: noTitle,
          onPressed: noOnpressed,
        ),

        /// 확인 버튼
        CustomTextButton(
          width: ButtonSize.veryLarge,
          height: ButtonSize.small40,
          title: yesTitle,
          onPressed: yesOnpressed,
        )
      ],
    );
  }
}
