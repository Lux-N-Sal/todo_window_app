import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/style/component/button/custom_outlined_button.dart';
import 'package:todo_window_app/style/resources/button_size.dart';

class OutlinedLoadingButton extends ConsumerWidget {
  const OutlinedLoadingButton({
    super.key,
    ButtonSize? width,
    ButtonSize? height,
    double? fontSize,
    bool? isDisabled,
    this.margin,
  })  : width = width ?? ButtonSize.small,
        height = height ?? ButtonSize.small,
        fontSize = fontSize ?? 12,
        isDisabled = isDisabled ?? false;

  final ButtonSize width;
  final ButtonSize height;
  final EdgeInsetsGeometry? margin;
  final double fontSize;
  final bool isDisabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomOutlinedButton(
        hoverColor: ref.theme.color.hoverColor,
        splashColor: ref.theme.color.splashColor,
        borderColor: ref.theme.color.text,

        /// 사이즈
        width: width,
        height: height,

        /// 마진
        margin: margin,

        /// 활성화 여부
        isDisabled: true,
        color: ref.theme.color.background,
        onPressed: () {},
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: SizedBox(
              width: ButtonSize.small.getSize(),
              height: ButtonSize.small.getSize(),
              child: CircularProgressIndicator(
                color: ref.theme.color.text,
                backgroundColor: ref.theme.color.background,
              ),
            ),
          ),
        ));
  }
}
