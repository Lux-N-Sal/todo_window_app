import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomCheckBox extends ConsumerWidget {
  const CustomCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.scale,
  });
  final double? scale;
  final bool value;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Transform.scale(
      scale: scale ?? 0.8,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
