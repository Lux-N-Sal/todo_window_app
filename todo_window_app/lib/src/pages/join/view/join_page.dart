// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/custom_error/custom_error.dart';
import 'package:todo_window_app/src/pages/join/provider/join_provider.dart';
import 'package:todo_window_app/src/pages/join/view/widgets/join_box.dart';
import 'package:todo_window_app/src/public/widgets/error_dialog.dart';
import 'package:todo_window_app/src/public/widgets/titlebar.dart';
import 'package:todo_window_app/util/lang/provider/lang_provider.dart';

class JoinPage extends ConsumerWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(asyncJoinProvider, (previous, next) {
      next.when(
        data: (data) {
          ref.read(joinViewmodelProvider.notifier).loadingEnd();
          if (data) {
            Navigator.pop(context, true);
          }
        },
        error: (error, stackTrace) {
          errorDialog(context, (error as CustomError).error);
          ref.read(joinViewmodelProvider.notifier).loadingEnd();
        },
        loading: () {
          ref.read(joinViewmodelProvider.notifier).loadingStart();
        },
      );
    });
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
                body: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      JoinTitle(),
                      SizedBox(height: 30),
                      JoinBox(),
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

class JoinTitle extends ConsumerWidget {
  const JoinTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      "계정 생성",
      style: ref.theme.font.headline2,
    );
  }
}
