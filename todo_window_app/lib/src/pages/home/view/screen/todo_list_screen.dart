// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/pages/home/provider/session_provider.dart';
import 'package:todo_window_app/src/pages/home/provider/state/todo_list_state.dart';
import 'package:todo_window_app/src/pages/home/provider/todo_list_provider.dart';
import 'package:todo_window_app/src/pages/home/provider/todo_list_screen_viewmodel.dart';
import 'package:todo_window_app/src/repositories/provider/todo_list_repository_provider.dart';
import 'package:todo_window_app/style/component/editable_listTile.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({
    super.key,
    required this.todoList,
    required this.selectedIndex,
  });

  final List<TodoListState> todoList;
  final int selectedIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(todoListScreenViewmodelProvider);
    return Column(
      children: [
        EditableListTile(
          title: todoList[selectedIndex].name,
          controller: todoList[selectedIndex].controller,
          isEditing: viewmodel.isEditing,
          focusNode: todoList[selectedIndex].focusNode,
          sufOnPressed: () {
            ref
                .read(todoListScreenViewmodelProvider.notifier)
                .setEditing(false);
            ref.read(todoListRepositoryProvider).editTodoList(
                  jwt: ref.watch(sessionProvider).jwt,
                  listId: todoList[selectedIndex].id,
                  listName: todoList[selectedIndex].controller.text,
                );
          },
          onSubmitted: (title) {
            ref
                .read(todoListScreenViewmodelProvider.notifier)
                .setEditing(false);
            ref.read(todoListRepositoryProvider).editTodoList(
                  jwt: ref.watch(sessionProvider).jwt,
                  listId: todoList[selectedIndex].id,
                  listName: title,
                );
            ref.read(todoListProvider.notifier).editTitle(
                index: selectedIndex,
                title: todoList[selectedIndex].controller.text);
          },
        ),
      ],
    );
  }
}
