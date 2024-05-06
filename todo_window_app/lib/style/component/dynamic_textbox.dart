import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';

/// Dynamic Text Field이다.
/// Expadnded안에서 돌아간다.
/// Expanded 밖에서 사용은 하지 말자
class DynamicTextBox extends ConsumerWidget {
  const DynamicTextBox({
    super.key,
    required this.text,
    this.style,
    this.maxLines,
  });

  final String text;
  final TextStyle? style;
  final int? maxLines;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Text(
        text,
        style: style ?? ref.theme.font.boldbody1,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines ?? 1,
      ),
    );
  }
}
