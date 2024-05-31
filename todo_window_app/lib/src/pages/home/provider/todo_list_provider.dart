import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/pages/home/provider/state/todo_list_state.dart';

part 'todo_list_provider.g.dart';

@Riverpod(dependencies: [])
class TodoList extends _$TodoList {
  @override
  List<TodoListState> build() {
    return [];
  }

  void set(List<TodoListState> todos) {
    state = todos;
  }
}
