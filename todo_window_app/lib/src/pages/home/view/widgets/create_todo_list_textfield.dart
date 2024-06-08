// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/enum/api.dart';
import 'package:todo_window_app/src/pages/home/provider/nav_viewmodel_provider.dart';
import 'package:todo_window_app/src/pages/home/provider/session_provider.dart';
import 'package:todo_window_app/src/pages/home/provider/todo_list_provider.dart';
import 'package:todo_window_app/src/repositories/api/provider/todo_list_repository_provider.dart';
import 'package:todo_window_app/style/component/custom_border_textfield.dart';

class CreateTodoListTextfield extends ConsumerWidget {
  const CreateTodoListTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(navViewmodelProvider).createTodoListController;
    final jwt = ref.watch(sessionProvider).jwt;
    return Container(
      decoration: BoxDecoration(
        color: ref.theme.color.background,
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomBorderTextField(
              preIcon: Icons.add,
              sufIcon: Icons.add,
              sufOnPressed: () async {
                final res = await ref
                    .read(todoListRepositoryProvider)
                    .createTodoList(jwt: jwt, listName: controller.text);
                if (res.resultType == APIResult.s.getString()) {
                  ref.read(todoListProvider.notifier).add(res.body);
                }
              },
              title: "새 목록",
              controller: controller,
              onSubmitted: (text) async {
                final res = await ref
                    .read(todoListRepositoryProvider)
                    .createTodoList(jwt: jwt, listName: text);
                if (res.resultType == APIResult.s.getString()) {
                  ref.read(todoListProvider.notifier).add(res.body);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
