import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/repositories/api/todo_list_repository.dart';
import 'package:todo_window_app/src/services/api/provider/todo_list_api_services.dart';
import 'package:todo_window_app/src/services/local/provider/log_file_service_provider.dart';

part 'todo_list_repository_provider.g.dart';

@Riverpod(dependencies: [todoListApiServices, logFileService])
TodoListRepository todoListRepository(TodoListRepositoryRef ref) {
  return TodoListRepository(
      todoListApiServices: ref.watch(todoListApiServicesProvider),
      logFileService: ref.watch(logFileServiceProvider));
}
