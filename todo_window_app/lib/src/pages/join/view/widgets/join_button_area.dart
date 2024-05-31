import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/dto/request/join_request_dto.dart';
import 'package:todo_window_app/src/pages/join/provider/join_provider.dart';
import 'package:todo_window_app/style/component/button/cancel_button.dart';
import 'package:todo_window_app/style/component/button/custom_loading_button.dart';
import 'package:todo_window_app/style/component/button/custom_text_button.dart';
import 'package:todo_window_app/style/resources/button_size.dart';

class JoinButtonsArea extends ConsumerWidget {
  const JoinButtonsArea({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(joinViewmodelProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CancelButton(
          width: ButtonSize.veryLarge,
          height: ButtonSize.small50,
          margin: const EdgeInsets.all(10),
          title: "취소",
          onPressed: () {
            Navigator.pop(context, false);
            print("취소");
          },
        ),
        viewmodel.isLoading
            ? const CustomLoadingButton(
                width: ButtonSize.superLarge,
                height: ButtonSize.small50,
                margin: EdgeInsets.all(10),
              )

            /// TODO: toast 구현하기
            : CustomTextButton(
                width: ButtonSize.superLarge,
                height: ButtonSize.small50,
                margin: const EdgeInsets.all(10),
                title: "확인",
                onPressed: () async {
                  final reqMsg = JoinRequestDto(
                    loginId: viewmodel.joinTextfieldState.idController.text,
                    userName: viewmodel.joinTextfieldState.nameController.text,
                    loginPw:
                        viewmodel.joinTextfieldState.passwordController.text,
                    userEmail:
                        viewmodel.joinTextfieldState.emailController.text,
                  );
                  final json = reqMsg.toMap();
                  await ref.read(asyncJoinProvider.notifier).join(json);
                },
              ),
      ],
    );
  }
}
