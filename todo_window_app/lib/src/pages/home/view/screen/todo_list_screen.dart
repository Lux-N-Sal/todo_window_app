import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/pages/home/provider/todo_list_provider.dart';
import 'package:todo_window_app/style/component/button/custom_circular_dropdown.dart';

class TodoListScreen extends ConsumerWidget {
  const TodoListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);
    print(todos.length);
    return Expanded(
      child: Container(
          width: double.infinity,
          color: ref.theme.color.surface,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: CustomCircularDropdown(
                  firstValue: todos[0].name,
                  items: [for (var todo in todos) todo.name],
                  onChanged: (value) {},
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(todos[index].name),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
