import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/style/component/custom_checkbox.dart';

class CustomTextCheckbox extends ConsumerWidget {
  const CustomTextCheckbox({
    super.key,
    required this.title,
    required this.value,
    required this.width,
    required this.height,
    this.onTap,
    this.onChanged,
    this.margin,
  });

  final String title;
  final bool value;
  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;

  final void Function()? onTap;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        hoverColor: ref.theme.color.hoverColor,
        title: Text(
          title,
          style: ref.theme.font.body2,
        ),
        onTap: onTap,
        leading: CustomCheckBox(
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
