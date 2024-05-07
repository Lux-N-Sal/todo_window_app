import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/public/widgets/titlebar.dart';
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
                body: const Column(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
