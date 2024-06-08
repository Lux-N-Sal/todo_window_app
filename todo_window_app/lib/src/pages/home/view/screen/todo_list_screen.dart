// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/pages/home/provider/nav_viewmodel_provider.dart';
import 'package:todo_window_app/src/pages/home/provider/session_provider.dart';
import 'package:todo_window_app/src/pages/home/provider/todo_list_data_provider.dart';
import 'package:todo_window_app/src/pages/home/provider/todo_list_provider.dart';
import 'package:todo_window_app/src/pages/home/provider/todo_list_screen_viewmodel.dart';
import 'package:todo_window_app/src/repositories/api/provider/todo_list_repository_provider.dart';
import 'package:todo_window_app/style/component/editable_list_tile.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(todoListScreenViewmodelProvider);
    final selectedIndex = ref.watch(navViewmodelProvider).selectedIndex;
    final todoLists = ref.watch(todoListDataProvider);
    final jwt = ref.watch(sessionProvider).jwt;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: EditableListTile(
                  index: selectedIndex,
                  title: todoLists[selectedIndex].name,
                  controller: todoLists[selectedIndex].controller,
                  isEditing: viewmodel.isEditing,
                  focusNode: todoLists[selectedIndex].focusNode,
                  sufOnPressed: () {
                    final listName = todoLists[selectedIndex].controller.text;
                    print("listName1: $listName");

                    ref
                        .read(todoListScreenViewmodelProvider.notifier)
                        .setEditing(false);
                    ref.read(todoListRepositoryProvider).editTodoList(
                          ref: ref,
                          jwt: jwt,
                          listId: todoLists[selectedIndex].id,
                          listName: listName,
                        );

                    ref.read(todoListProvider.notifier).onTabTitle(
                        title: todoLists[selectedIndex].name,
                        index: selectedIndex);
                    print("listName2: $listName");
                  },
                  onSubmitted: (title) {
                    final listName = todoLists[selectedIndex].controller.text;
                    print("listName1: $listName");

                    ref
                        .read(todoListScreenViewmodelProvider.notifier)
                        .setEditing(false);
                    ref.read(todoListRepositoryProvider).editTodoList(
                          ref: ref,
                          jwt: jwt,
                          listId: todoLists[selectedIndex].id,
                          listName: listName,
                        );

                    ref.read(todoListProvider.notifier).onTabTitle(
                        title: todoLists[selectedIndex].name,
                        index: selectedIndex);
                    print("listName2: $listName");
                  },
                ),
              ),
              PopupMenuButton(
                color: ref.theme.color.background,
                iconColor: ref.theme.color.text,
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      onTap: () {
                        ref.read(todoListRepositoryProvider).deleteTodoList(
                            jwt: jwt,
                            listId: todoLists[selectedIndex].id,
                            ref: ref);
                      },
                      child: ListTile(
                        leading: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 255, 82, 82),
                        ),
                        title: Text(
                          "삭제",
                          style: ref.theme.font.boldbody1.copyWith(
                            color: const Color.fromARGB(255, 255, 82, 82),
                          ),
                        ),
                      ),
                    )
                  ];
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
