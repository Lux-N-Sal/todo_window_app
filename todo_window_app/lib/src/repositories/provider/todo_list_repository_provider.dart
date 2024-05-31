import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/repositories/todo_list_repository.dart';
import 'package:todo_window_app/src/services/providers/todo_list_api_services.dart';

part 'todo_list_repository_provider.g.dart';

@Riverpod(dependencies: [todoListApiServices])
TodoListRepository todoListRepository(TodoListRepositoryRef ref) {
  return TodoListRepository(
      todoListApiServices: ref.watch(todoListApiServicesProvider));
}
