import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';

class SettingTile extends ConsumerWidget {
  const SettingTile({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: ref.theme.font.headline2,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            child: child,
          )
        ],
      ),
    );
  }
}
