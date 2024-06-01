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

  void set(List<TodoListState> todos) {
    state = todos;
  }
}
