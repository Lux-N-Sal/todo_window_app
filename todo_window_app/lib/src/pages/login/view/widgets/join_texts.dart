import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/style/resources/palette.dart';
import 'package:todo_window_app/util/lang/provider/lang_provider.dart';

/// 회원가입 문자
class JoinTexts extends ConsumerWidget {
  const JoinTexts({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final word = ref.watch(langProvider).language;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            word.not_a_member,
            style: ref.theme.font.boldbody2,
          ),
          const SignUpTextButton(),
        ],
      ),
    );
  }
}

class SignUpTextButton extends ConsumerStatefulWidget {
  const SignUpTextButton({
    super.key,
  });

  @override
  ConsumerState<SignUpTextButton> createState() => _SignUpTextButtonState();
}

class _SignUpTextButtonState extends ConsumerState<SignUpTextButton> {
  bool _isHovered = false;

  void _mouseHover(bool isHovered) {
    setState(() {
      _isHovered = !isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    final word = ref.watch(langProvider).language;
    return MouseRegion(
      onEnter: (_) => _mouseHover(_isHovered),
      onExit: (_) => _mouseHover(_isHovered),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(microseconds: 300),
        style: ref.theme.font.boldbody2.copyWith(
          color: _isHovered ? Palette.primaryHover : Palette.primary,
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/join');
          },
          child: Text(
            word.register_now,
          ),
        ),
      ),
    );
  }
}
