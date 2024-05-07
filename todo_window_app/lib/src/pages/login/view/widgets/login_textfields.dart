import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';

class LoginTextField extends ConsumerStatefulWidget {
  const LoginTextField({
    super.key,
    this.obscure,
    required this.title,
    required this.icon,
  });

  final bool? obscure;
  final String title;
  final IconData icon;

  @override
  ConsumerState<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends ConsumerState<LoginTextField> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.all(5),
      child: TextField(
        controller: textController,

        /// 비밀번호
        obscureText: widget.obscure ?? false,

        ///text style

        /// text style
        style: ref.theme.font.boldbody1.copyWith(
          // color: Palette.loginSelectColor,
          color: ref.theme.color.text,
        ),

        decoration: InputDecoration(
          /// 아이콘
          prefixIcon: Icon(
            widget.icon,
            // color: Palette.loginIconColor,
            color: ref.theme.color.text,
          ),

          /// 레이블
          labelText: widget.title,
          labelStyle: ref.theme.font.body1.copyWith(
            fontWeight: FontWeight.bold,
            // color: Palette.loginTextColor,
            color: ref.theme.color.text,
          ),
          floatingLabelStyle: ref.theme.font.body1.copyWith(
            fontWeight: FontWeight.bold,
            // color: Palette.loginSelectColor,
            color: ref.theme.color.text,
          ),

          /// 힌트
          hintText: widget.title,
          hintStyle: ref.theme.font.hintBody12,

          /// 색 채우기
          // fillColor: const Color(0xff165EAB),
          fillColor: ref.theme.color.container,
          filled: true,

          /// 박스 크기 조정
          isDense: true,

          /// 포커스 테두리
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ref.theme.color.selectedBoarderColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),

          // 평소 테두리
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              // color: Palette.loginTextColor,
              color: ref.theme.color.boarderColor,
              width: 1.0,
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

/// 비밀번호 text field
class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LoginTextField(
      obscure: true,
      title: "Password",
      icon: Icons.lock,
    );
  }
}

/// 아이디 text field
class TextFieldID extends StatelessWidget {
  const TextFieldID({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const LoginTextField(
      icon: Icons.account_circle,
      title: "ID",
    );
  }
}
