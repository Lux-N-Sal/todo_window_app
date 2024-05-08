import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/pages/login/view/widgets/border_textfields.dart';
import 'package:todo_window_app/src/pages/login/view/widgets/signup_texts.dart';
import 'package:todo_window_app/style/component/button/custom_text_button.dart';
import 'package:todo_window_app/style/resources/button_size.dart';

class LoginBox extends ConsumerWidget {
  const LoginBox({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 350,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(
          color: ref.theme.color.boarderColor,
        ),
        color: ref.theme.color.background,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldID(),
          TextFieldPassword(),
          LoginButton(),
          SignUpTexts(),
        ],
      ),
    );
  }
}

/// 로그인 버튼
class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: ButtonSize.ultraLarge,
      height: ButtonSize.small40,
      title: "Login",
      onPressed: () {},
    );
  }
}
