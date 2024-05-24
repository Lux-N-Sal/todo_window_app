// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/style/component/button/custom_circle_button.dart';
import 'package:todo_window_app/style/resources/button_size.dart';

class CustomBorderTextField extends ConsumerStatefulWidget {
  const CustomBorderTextField({
    super.key,
    bool? obscure,
    this.readonly,
    this.width,
    required this.title,
    this.preIcon,
    this.sufIcon,
    this.isEnable,
    this.focusBorderColor,
    this.contentPadding,
    this.focusNode,
    required this.controller,
    this.onFoucs,
    this.onChange,
    this.sufOnPressed,
    this.onSubmitted,
    this.backgroundColor,
  }) : obscure = obscure ?? false;

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
  final bool obscure;

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

  /// focus 시 함수
  final void Function()? onFoucs;

  /// textField에 글자작성시 함수
  final void Function(String)? onChange;

  /// suffix Icon 누르면 실행하는 함수
  final void Function()? sufOnPressed;

  /// textfield에서 엔터누를 시 실행하는 콜백함수
  final void Function(String)? onSubmitted;

  @override
  ConsumerState<CustomBorderTextField> createState() =>
      _CustomBorderTextFieldState();
}

class _CustomBorderTextFieldState extends ConsumerState<CustomBorderTextField> {
  @override
  void initState() {
    if (widget.focusNode != null) {
      widget.focusNode!.addListener(() {
        onFocus();
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    if (widget.focusNode != null) {
      widget.focusNode!.removeListener(() {
        onFocus();
      });
    }

    super.dispose();
  }

  void onFocus() {
    if (widget.focusNode!.hasFocus) {
      widget.onFoucs!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 250,
      height: 40,
      margin: const EdgeInsets.all(5),
      child: TextField(
        focusNode: widget.focusNode,
        controller: widget.controller,

        readOnly: widget.readonly ?? false,

        enabled: widget.isEnable,

        /// 텍스트 필드 내용 변경 시
        onChanged: widget.onChange,

        /// 비밀번호 효과
        obscureText: widget.obscure,

        /// text style
        style: ref.theme.font.boldbody2.copyWith(
          color: ref.theme.color.text,
        ),

        decoration: InputDecoration(
          contentPadding: widget.contentPadding ?? const EdgeInsets.all(0),

          /// 아이콘
          prefixIcon: widget.preIcon != null
              ? Icon(
                  widget.preIcon,
                  color: ref.theme.color.text,
                )
              : null,

          suffixIcon: widget.sufIcon != null
              // ? IconButton(
              //     hoverColor: ref.theme.color.hoverColor,
              //     splashColor: ref.theme.color.splashColor,
              //     icon: Icon(
              //       widget.sufIcon,
              //       color: ref.theme.color.text,
              //     ),
              //     onPressed: widget.sufOnPressed,
              //   )
              ? CustomCircleButton(
                  backgroundColor: Colors.transparent,
                  width: ButtonSize.tiny20,
                  height: ButtonSize.tiny20,
                  icon: widget.sufIcon!,
                  onPressed: () {},
                )
              : null,

          /// 레이블
          labelText: widget.title,
          labelStyle: ref.theme.font.body2.copyWith(
            fontWeight: FontWeight.bold,
            color: ref.theme.color.text,
          ),
          floatingLabelStyle: ref.theme.font.body2.copyWith(
            fontWeight: FontWeight.bold,
            color: ref.theme.color.text,
          ),

          /// 힌트
          hintText: widget.title,
          hintStyle: ref.theme.font.hintBody12,

          /// 색 채우기
          fillColor: widget.backgroundColor ?? ref.theme.color.container,
          filled: true,

          /// 박스 크기 조정
          // isDense: true,

          /// 포커스 테두리
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.focusBorderColor ??
                  ref.theme.color.selectedBoarderColor,
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

        onSubmitted: widget.onSubmitted,
      ),
    );
  }
}
