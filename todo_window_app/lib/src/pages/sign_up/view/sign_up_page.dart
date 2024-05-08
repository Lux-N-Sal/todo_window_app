import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/dto/sign_up_request_dto.dart';
import 'package:todo_window_app/src/pages/login/view/widgets/border_textfields.dart';
import 'package:todo_window_app/src/pages/sign_up/provider/sign_up_provider.dart';
import 'package:todo_window_app/src/public/widgets/titlebar.dart';
import 'package:todo_window_app/src/repository/post/signup.dart';
import 'package:todo_window_app/style/component/button/cancel_button.dart';
import 'package:todo_window_app/style/component/button/custom_text_button.dart';
import 'package:todo_window_app/style/resources/button_size.dart';
import 'package:todo_window_app/util/lang/provider/lang_provider.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final word = ref.watch(langProvider).language;
    return Scaffold(
      body: Container(
        color: ref.theme.color.background,
        child: Column(
          children: [
            const TitleBar(),
            Expanded(
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    word.sign_up,
                    style: ref.theme.font.headline1,
                  ),
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "계정 생성",
                        style: ref.theme.font.headline2,
                      ),
                      const SizedBox(height: 30),
                      const SignUpBox(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpBox extends ConsumerWidget {
  const SignUpBox({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// 아이디 중복검사 버튼 필요함
        BorderTextField(
          title: "ID",
          icon: Icons.account_circle,
          width: 400,
          onChanged: (id) {
            ref.read(signUpProvider.notifier).setId(id);
          },
        ),

        BorderTextField(
          title: "Name",
          icon: Icons.badge,
          width: 400,
          onChanged: (name) {
            ref.read(signUpProvider.notifier).setName(name);
          },
        ),

        /// 비밀번호 정책에 따른 비밀번호 추가해야함.
        BorderTextField(
          title: "Password",
          icon: Icons.lock,
          width: 400,
          onChanged: (password) {
            ref.read(signUpProvider.notifier).setPassword(password);
          },
        ),

        /// 비밀번호 확인 로직 필요함.
        BorderTextField(
          title: "Re-enter password",
          icon: Icons.lock_person,
          width: 400,
          onChanged: (passwordCheck) {
            ref.read(signUpProvider.notifier).setPasswordCheck(passwordCheck);
          },
        ),

        /// 이메일 확인 로직 필요함.
        BorderTextField(
          title: "Email",
          icon: Icons.mail,
          width: 400,
          onChanged: (email) {
            ref.read(signUpProvider.notifier).setEmail(email);
          },
        ),
        ProviderScope(
          overrides: [
            signUpTextProvider.overrideWith((ref) => ref.watch(signUpProvider)),
          ],
          child: const SignUpButtonsArea(),
        ),
      ],
    );
  }
}

class SignUpButtonsArea extends ConsumerWidget {
  const SignUpButtonsArea({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpTextProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CancelButton(
          width: ButtonSize.veryLarge,
          height: ButtonSize.small50,
          margin: const EdgeInsets.all(10),
          title: "취소",
          onPressed: () {},
        ),
        CustomTextButton(
          width: ButtonSize.superLarge,
          height: ButtonSize.small50,
          margin: const EdgeInsets.all(10),
          title: "확인",
          onPressed: () {
            print(
                "${signUpState.id}\n${signUpState.name}\n${signUpState.password}\n${signUpState.passwordCheck}\n${signUpState.email}");

            final dto = SignUpRequestDto(
              loginId: signUpState.id,
              userName: signUpState.name,
              loginPw: signUpState.password,
              loginPwCheck: signUpState.passwordCheck,
              userEmail: signUpState.email,
            );
            final json = dto.toMap();
            ref.read(requestSignUpProvider.notifier).signUp(json);
          },
        ),
      ],
    );
  }
}
