// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/custom_error/custom_error.dart';
import 'package:todo_window_app/src/pages/login/providers/login_provider.dart';
import 'package:todo_window_app/src/pages/login/view/widgets/login_box.dart';
import 'package:todo_window_app/src/public/widgets/error_dialog.dart';
import 'package:todo_window_app/src/public/widgets/titlebar.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(asyncLoginProvider, (previous, next) {
      next.when(
        data: (data) {
          ref.read(loginViewmodelProvider.notifier).isLoadingEnd();
          ref.read(loginViewmodelProvider.notifier).goHomePage(ref);
        },
        error: (error, stackTrace) {
          errorDialog(ref, (error as CustomError).error);
          ref.read(loginViewmodelProvider.notifier).isLoadingEnd();
        },
        loading: () {
          ref.read(loginViewmodelProvider.notifier).isLoadingStart();
        },
      );
    });
    return const Scaffold(
      body: Column(
        children: [
          /// 상단바
          TitleBar(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginIcon(),
                SizedBox(height: 50),
                LoginBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginIcon extends ConsumerWidget {
  const LoginIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Icon(
      Icons.polymer,
      color: ref.theme.color.text,
      size: 100,
    );
  }
}
