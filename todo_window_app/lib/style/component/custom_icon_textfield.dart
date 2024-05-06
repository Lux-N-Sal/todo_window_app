import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';

class CustomIconTextField extends ConsumerWidget {
  const CustomIconTextField({
    super.key,
    this.obscure,
    required this.title,
    required this.icon,
    required this.controller,
    this.onChanged,
    this.enabled,
    this.margin,
    this.boarderColor,
    this.isConfirm,
    this.enableMsg,
  });

  /// 문자를 * 모양으로 대체할지 여부
  final bool? obscure;

  /// 레이블, 힌트에 들어갈 문자
  final String title;

  /// 앞에 위치할 아이콘
  final IconData icon;

  /// 컨트롤러
  final TextEditingController controller;

  /// 변경 함수
  final void Function(String)? onChanged;

  /// 활성화 여부
  /// 주로 토큰 로그인 창에서 토큰 요청을 눌렀을 때 사용하도록 하기 위해서 사용한다.
  final bool? enabled;

  /// 마진
  final EdgeInsetsGeometry? margin;

  /// 테두리 색
  final Color? boarderColor;

  /// 비밀번호 변경 창에서 사용하는
  /// 새 비밀번호 비밀번호 확인 값이 같은지 여부
  final bool? isConfirm;

  final String? enableMsg;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: margin,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: ref.theme.font.boldbody1,
        obscureText: obscure ?? false,
        enabled: enabled ?? true,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color:
                enabled ?? true ? ref.theme.color.text : ref.theme.color.hint,
          ),

          /// 레이블
          labelText: enabled ?? true ? title : enableMsg ?? "",
          labelStyle: enabled ?? true
              ? ref.theme.font.boldbody1
              : ref.theme.font.boldhintBody10,
          floatingLabelStyle: ref.theme.font.boldbody1,

          /// 힌트
          hintText: title,
          hintStyle: ref.theme.font.hintBody12,

          /// 색 채우기
          fillColor: ref.theme.color.background,
          filled: true,

          isDense: true,

          /// 포커스 테두리
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isConfirm == null
                  ? ref.theme.color.boarderColor
                  : isConfirm!
                      ? ref.theme.color.selectSuccessBoard
                      : ref.theme.color.selectWarningBoard,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),

          // 평소 테두리
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isConfirm == null
                  ? ref.theme.color.boarderColor
                  : isConfirm!
                      ? ref.theme.color.successBoard
                      : ref.theme.color.warningBoard,
              width: 1.0,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),

          /// eanbled false인 테두리
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ref.theme.color.warningBoard,
              width: 2.0,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
