import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';

class CustomDropdown extends ConsumerWidget {
  const CustomDropdown({
    super.key,
    required this.firstValue,
    required this.onChanged,
    required this.items,
    this.margin,
  });

  final String firstValue;
  final void Function(String? value) onChanged;
  final List<String> items;
  // final double margin;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: margin,
      height: 40,
      decoration: BoxDecoration(
        color: ref.theme.color.background,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(5),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<String>(
          /// 메뉴 길이
          menuMaxHeight: 200,

          /// 드롭다운 메뉴 색
          dropdownColor: ref.theme.color.background,

          /// 첫번재 값
          value: firstValue,

          /// 변경 함수
          onChanged: (value) {
            onChanged(value);
          },

          underline: Container(),

          /// 드롭다운 메뉴 리스트
          items: items.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  style: ref.theme.font.body3.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
