import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/pages/join/provider/join_provider.dart';
import 'package:todo_window_app/src/pages/join/view/widgets/join_button_area.dart';
import 'package:todo_window_app/style/component/custom_border_textfield.dart';

class JoinBox extends ConsumerWidget {
  const JoinBox({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(joinViewmodelProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// 아이디 중복검사 버튼 필요함
        CustomBorderTextField(
          title: "ID",
          controller: viewmodel.joinTextfieldState.idController,
          preIcon: Icons.account_circle,
          width: 400,
        ),

        CustomBorderTextField(
          title: "Name",
          controller: viewmodel.joinTextfieldState.nameController,
          preIcon: Icons.badge,
          width: 400,
        ),

        /// 비밀번호 정책에 따른 비밀번호 추가해야함.
        CustomBorderTextField(
          title: "Password",
          controller: viewmodel.joinTextfieldState.passwordController,
          preIcon: Icons.lock,
          width: 400,
        ),

        /// 비밀번호 확인 로직 필요함.

        CustomBorderTextField(
          title: "Re-enter password",
          controller: viewmodel.joinTextfieldState.passwordCheckController,
          preIcon: Icons.lock_person,
          width: 400,
        ),

        /// 이메일 확인 로직 필요함.
        CustomBorderTextField(
          title: "Email",
          controller: viewmodel.joinTextfieldState.emailController,
          preIcon: Icons.mail,
          width: 400,
        ),
        const JoinButtonsArea()
      ],
    );
  }
}
