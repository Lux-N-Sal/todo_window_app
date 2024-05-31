// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_window_app/src/custom_error/custom_error.dart';
import 'package:todo_window_app/src/dto/response/todo_list_response_dto.dart';
import 'package:todo_window_app/src/services/log_service.dart';
import 'package:todo_window_app/src/services/todo_list_api_services.dart';

class TodoListRepository {
  final TodoListApiServices todoListApiServices;
  TodoListRepository({
    required this.todoListApiServices,
  });

  Future<GetTodoListResponseDto> getTodoList({required String jwt}) async {
    try {
      final GetTodoListResponseDto res =
          await todoListApiServices.getTodos(jwt: jwt);

      return res;
    } catch (error, stackTrace) {
      Logger.errorLog(
          target: "TodoListRepository/getTodoList()",
          error: error,
          stackTrace: stackTrace);
      throw CustomError(error: error.toString());
    }
  }
}