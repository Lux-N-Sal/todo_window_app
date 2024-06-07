import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/services/api/provider/dio_provider.dart';
import 'package:todo_window_app/src/services/api/todo_list_api_services.dart';
import 'package:todo_window_app/src/services/local/provider/log_file_service_provider.dart';

part 'todo_list_api_services.g.dart';

@Riverpod(dependencies: [dio, logFileService])
TodoListApiServices todoListApiServices(TodoListApiServicesRef ref) {
  return TodoListApiServices(
      dio: ref.watch(dioProvider),
      logFileService: ref.watch(logFileServiceProvider));
}
