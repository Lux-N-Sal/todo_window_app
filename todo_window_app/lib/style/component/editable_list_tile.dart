import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/pages/home/provider/todo_list_provider.dart';
import 'package:todo_window_app/src/pages/home/provider/todo_list_screen_viewmodel.dart';
import 'package:todo_window_app/style/component/button/custom_circle_button.dart';
import 'package:todo_window_app/style/resources/button_size.dart';

class EditableListTile extends ConsumerWidget {
  final String title;
  final TextEditingController controller;
  final bool isEditing;
  final FocusNode focusNode;
  final int index;

  final void Function()? sufOnPressed;
  final void Function(String)? onSubmitted;

  const EditableListTile({
    super.key,
    required this.title,
    required this.controller,
    required this.isEditing,
    required this.focusNode,
    required this.index,
    this.sufOnPressed,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if (isEditing) {
          focusNode.unfocus();
        }
      },
      child: ListTile(
        hoverColor: ref.theme.color.hoverColor,
        splashColor: ref.theme.color.splashColor,
        title: isEditing
            ? StatelessTextfeild(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                title: "리스트명 수정",
                labelStyle: ref.theme.font.boldbody1,
                textStyle: ref.theme.font.headline1,
                controller: controller,
                focusNode: focusNode,
                sufIcon: Icons.edit,
                sufOnPressed: sufOnPressed,
                onSubmitted: onSubmitted,
              )
            : ListTile(
                hoverColor: ref.theme.color.hoverColor,
                splashColor: ref.theme.color.splashColor,
                title: Text(
                  title,
                  style: ref.theme.font.headline1,
                ),
                onTap: () {
                  ref
                      .read(todoListProvider.notifier)
                      .onTabTitle(index: index, title: title);
                  ref
                      .read(todoListScreenViewmodelProvider.notifier)
                      .setEditing(true);
                  focusNode.requestFocus();
                },
              ),
      ),
    );
  }
}

class StatelessTextfeild extends ConsumerWidget {
  const StatelessTextfeild({
    super.key,
    this.readonly,
    this.width,
    required this.title,
    this.preIcon,
    this.sufIcon,
    this.obscure,
    this.isEnable,
    this.focusBorderColor,
    this.contentPadding,
    required this.focusNode,
    required this.controller,
    this.backgroundColor,
    this.textStyle,
    this.labelStyle,
    this.onFoucs,
    this.onChange,
    this.sufOnPressed,
    this.onSubmitted,
  });

  /// 읽기 전용인지
  final bool? readonly;

  /// 가로 폭
  final double? width;

  /// text field 이름
  final String title;

  /// 앞쪽 아이콘
  final IconData? preIcon;

  /// 뒤쪽 아이콘
  /// 버튼으로 사용할 수 있다.
  final IconData? sufIcon;

  /// 비밀번호 text 여부
  /// ***로 입력된다.
  final bool? obscure;

  /// enable 여부
  final bool? isEnable;

  /// 선택 테두리 색 지정
  final Color? focusBorderColor;

  /// text field 안에 패딩 값
  final EdgeInsetsGeometry? contentPadding;

  /// text field focus 시 호출되는 함수
  final FocusNode? focusNode;

  /// text editing controller
  final TextEditingController controller;

  final Color? backgroundColor;

  /// 글자 스타일
  final TextStyle? textStyle;

  final TextStyle? labelStyle;

  /// focus 시 함수
  final void Function()? onFoucs;

  /// textField에 글자작성시 함수
  final void Function(String)? onChange;

  /// suffix Icon 누르면 실행하는 함수
  final void Function()? sufOnPressed;

  /// textfield에서 엔터누를 시 실행하는 콜백함수
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width ?? 250,
      height: 40,
      margin: const EdgeInsets.all(5),
      child: TextField(
        focusNode: focusNode,
        controller: controller,

        readOnly: readonly ?? false,

        enabled: isEnable,

        /// 텍스트 필드 내용 변경 시
        onChanged: onChange,

        /// 비밀번호 효과
        obscureText: obscure ?? false,

        /// text style
        style: textStyle ?? ref.theme.font.boldbody2,

        decoration: InputDecoration(
          contentPadding: contentPadding ?? const EdgeInsets.all(0),

          /// 아이콘
          prefixIcon: preIcon != null
              ? Icon(
                  preIcon,
                  color: ref.theme.color.text,
                )
              : null,

          suffixIcon: sufIcon != null
              ? CustomCircleButton(
                  backgroundColor: Colors.transparent,
                  width: ButtonSize.tiny20,
                  height: ButtonSize.tiny20,
                  icon: sufIcon!,
                  onPressed: sufOnPressed ?? () {},
                )
              : null,

          /// 레이블
          labelText: title,
          labelStyle: labelStyle ??
              ref.theme.font.body2.copyWith(
                fontWeight: FontWeight.bold,
                color: ref.theme.color.text,
              ),
          floatingLabelStyle: labelStyle ??
              ref.theme.font.body2.copyWith(
                fontWeight: FontWeight.bold,
                color: ref.theme.color.text,
              ),

          /// 힌트
          hintText: title,
          hintStyle: ref.theme.font.hintBody12,

          /// 색 채우기
          fillColor: backgroundColor ?? ref.theme.color.container,
          filled: true,

          /// 박스 크기 조정
          // isDense: true,

          /// 포커스 테두리
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: focusBorderColor ?? ref.theme.color.selectedBoarderColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),

          // 평소 테두리
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ref.theme.color.boarderColor,
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),

          // 비활성 상태 테두리
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ref.theme.color.boarderColor,
              width: 2.0,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),

        onSubmitted: onSubmitted,
      ),
    );
  }
}
