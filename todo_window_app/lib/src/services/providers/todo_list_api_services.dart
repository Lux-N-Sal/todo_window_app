import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/services/providers/dio_provider.dart';
import 'package:todo_window_app/src/services/todo_list_api_services.dart';

part 'todo_list_api_services.g.dart';

@Riverpod(dependencies: [dio])
TodoListApiServices todoListApiServices(TodoListApiServicesRef ref) {
  return TodoListApiServices(dio: ref.watch(dioProvider));
}
