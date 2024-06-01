// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/style/resources/palette.dart';

class CustomCircularDropdown extends ConsumerWidget {
  const CustomCircularDropdown({
    super.key,
    required this.firstValue,
    required this.onChanged,
    required this.items,
  });

  final String firstValue;
  final void Function(String? value) onChanged;
  final List<String> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
        decoration: BoxDecoration(
            color:
                ref.theme.color.primary, //background color of dropdown button
            border: Border.all(
              color: Colors.black38,
              width: 2,
            ), //border of dropdown button
            borderRadius:
                BorderRadius.circular(50), //border raiuds of dropdown button
            boxShadow: const <BoxShadow>[
              //apply shadow on Dropdown button
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                blurRadius: 5,
              ) //blur radius of shadow
            ]),
        child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: DropdownButton<String>(
              value: firstValue,

              /// 드롭다운 메뉴 리스트
              items: items.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      style: ref.theme.font.headline3.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ref.theme.color.onPrimary,
                      ),
                    ),
                  );
                },
              ).toList(),

              /// 변경 함수
              onChanged: (value) {
                onChanged(value);
              },

              /// 트레일링 아이콘이다.
              icon: const Padding(
                  //Icon at tail, arrow bottom is default icon
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.arrow_circle_down_sharp)),
              iconEnabledColor: Colors.white, //Icon color
              style: ref.theme.font.headline1.copyWith(
                color: ref.theme.color.onPrimary,
              ),

              dropdownColor: Palette.primaryHover, //dropdown background color
              underline: Container(), //remove underline
              isExpanded: true, //make true to make width 100%
            )));
  }
}
