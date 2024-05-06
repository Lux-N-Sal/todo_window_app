import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';

class CustomNavTile extends ConsumerWidget {
  const CustomNavTile({
    super.key,
    required this.isSelected,
    required this.title,
    this.onTap,
  });

  final bool isSelected;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color:
            isSelected ? ref.theme.color.selectedTileColor : Colors.transparent,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          hoverColor: ref.theme.color.hoverColor,
          hoverDuration: const Duration(milliseconds: 100),
          splashColor: ref.theme.color.splashColor,
          onTap: onTap,
          child: Center(
            child: Text(
              title,
              style: ref.theme.font.boldbody1,
            ),
          ),
        ),
      ),
    );
  }
}
