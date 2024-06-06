import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/pages/home/provider/state/todo_list_state.dart';
import 'package:todo_window_app/src/services/log_service.dart';

part 'todo_list_provider.g.dart';

@Riverpod(dependencies: [], keepAlive: true)
class TodoList extends _$TodoList {
  @override
  List<TodoListState> build() {
    ref.onDispose(
      () {
        Logger.debugLog(target: "TodoList.provider", message: "disposed");
      },
    );
    return [];
  }

  void set(List<TodoListState> todoLists) {
    state = todoLists;
  }

  void add(TodoListState todoList) {
    state = [...state, todoList];
  }

  void setTitle({required int index, required String title}) {
    state[index].controller.text = title;
  }

  void editTitle({required int index, required String title}) {
    final todoList = state;
    todoList[index] = state[index].copyWith(
      name: title,
    );
    state[index] = state[index].copyWith(
      name: title,
    );

    state = state
        .map(
          (todo) =>
              todo.id == state[index].id ? todo.copyWith(name: title) : todo,
        )
        .toList();
  }
}
