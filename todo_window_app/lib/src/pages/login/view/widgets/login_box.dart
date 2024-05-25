import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/dto/request/login_request_dto.dart';
import 'package:todo_window_app/src/pages/login/providers/login_provider.dart';
import 'package:todo_window_app/src/pages/login/view/widgets/join_texts.dart';
import 'package:todo_window_app/style/component/button/custom_loading_button.dart';
import 'package:todo_window_app/style/component/button/custom_text_button.dart';
import 'package:todo_window_app/style/component/custom_border_textfield.dart';
import 'package:todo_window_app/style/resources/button_size.dart';

class LoginBox extends ConsumerWidget {
  const LoginBox({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(loginViewmodelProvider);
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomBorderTextField(
            title: "ID",
            preIcon: Icons.account_circle,
            controller: viewmodel.loginTextfieldState.idController,
            width: 300,
          ),
          CustomBorderTextField(
            title: "Password",
            preIcon: Icons.lock,
            obscure: true,
            controller: viewmodel.loginTextfieldState.passwordController,
            width: 300,
          ),
          const LoginButton(),
          const JoinTexts(),
        ],
      ),
    );
  }
}

/// 로그인 버튼
class LoginButton extends ConsumerWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(loginViewmodelProvider);
    return viewmodel.isLoading
        ? CustomLoadingButton(
            margin: const EdgeInsets.symmetric(vertical: 5),
            width: ButtonSize.ultraLarge,
            height: ButtonSize.small40,
            backgroundColor: ref.theme.color.primary,
          )
        : CustomTextButton(
            margin: const EdgeInsets.symmetric(vertical: 5),
            width: ButtonSize.ultraLarge,
            height: ButtonSize.small40,
            title: "Login",
            onPressed: () async {
              final req = LoginRequestDto(
                loginId: viewmodel.loginTextfieldState.idController.text,
                loginPw: viewmodel.loginTextfieldState.passwordController.text,
              );

              final json = req.toMap();
              ref.read(asyncLoginProvider.notifier).login(json);
            },
          );
  }
}
