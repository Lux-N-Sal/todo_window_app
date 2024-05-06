import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';

class CustomTextField extends ConsumerWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);
  final String title;
  final TextEditingController controller;
  final void Function(String? value) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: TextField(
        controller: controller,

        onChanged: onChanged,

        /// text style
        style: ref.theme.font.body1.copyWith(
          fontWeight: FontWeight.bold,
        ),

        decoration: InputDecoration(
          labelText: title,
          labelStyle: ref.theme.font.body2.copyWith(
            fontWeight: FontWeight.bold,
          ),
          hintText: title,
          hintStyle: ref.theme.font.hintBody12,
          fillColor: ref.theme.color.background,
          filled: true,
          isDense: true,
        ),
      ),
    );
  }
}
