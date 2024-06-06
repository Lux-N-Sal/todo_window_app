import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/pages/home/provider/state/todo_list_state.dart';

part 'todo_list_data_provider.g.dart';

@Riverpod(dependencies: [])
List<TodoListState> todoListData(TodoListDataRef ref) {
  throw UnimplementedError();
}
