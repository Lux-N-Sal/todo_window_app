// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:todo_window_app/src/dto/response/todo_list_response_dto.dart';
import 'package:todo_window_app/src/enum/endpoint_enum.dart';
import 'package:todo_window_app/src/enum/json_tag.dart';
import 'package:todo_window_app/src/services/log_service.dart';
import 'package:todo_window_app/src/services/providers/dio_provider.dart';

class TodoListApiServices {
  Dio dio;
  TodoListApiServices({
    required this.dio,
  });
  Future<TodoListsResponseDto> getTodoLists({required String jwt}) async {
    try {
      final Response res = await dio.get(
        Endpoint.getTodoLists.getPath(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $jwt',
          },
        ),
      );
      if (res.statusCode != 200) {
        throw dioError(res);
      }
      print(res.data.toString());
      return TodoListsResponseDto.fromJson(res.data);
    } catch (error, stackTrace) {
      Logger.errorLog(
        target: "TodoListApiServices/getTodoLists()",
        error: error,
        stackTrace: stackTrace,
      );
      return TodoListsResponseDto.init();
    }
  }

  Future<TodoListResponseDto> createTodoList({
    required String jwt,
    required String listName,
  }) async {
    try {
      final Response res = await dio.post(
        Endpoint.createList.getPath(),
        options: Options(
          headers: {
            JsonTag.authorization.getString(): 'Bearer $jwt',
          },
        ),
        data: {JsonTag.listName.getString(): listName},
      );
      if (res.statusCode != 200) {
        throw dioError(res);
      }
      return TodoListResponseDto.fromJson(res.data);
    } catch (error, stackTrace) {
      Logger.errorLog(
        target: "TodoListApiServices/createTodoList()",
        error: error,
        stackTrace: stackTrace,
      );
      return TodoListResponseDto.init();
    }
  }

  Future<EmptyResponseDto> editTodoList({
    required String jwt,
    required String listId,
    required String listName,
  }) async {
    try {
      final Response res = await dio.put(
        "${Endpoint.list.getPath()}/$listId",
        options: Options(
          headers: {
            JsonTag.authorization.getString(): 'Bearer $jwt',
          },
        ),
        data: {JsonTag.changeListName.getString(): listName},
      );
      if (res.statusCode != 200) {
        throw dioError(res);
      }
      print(res.data);
      return EmptyResponseDto.fromJson(res.data);
    } catch (error, stackTrace) {
      Logger.errorLog(
        target: "TodoListApiServices/editTodoList()",
        error: error,
        stackTrace: stackTrace,
      );
      return EmptyResponseDto.init();
    }
  }

  Future<EmptyResponseDto> deleteTodoList({
    required String jwt,
    required String listId,
  }) async {
    try {
      final Response res = await dio.delete(
        "${Endpoint.list.getPath()}/$listId",
        options: Options(
          headers: {
            JsonTag.authorization.getString(): 'Bearer $jwt',
          },
        ),
      );
      if (res.statusCode != 200) {
        throw dioError(res);
      }
      print(res.data);
      return EmptyResponseDto.fromJson(res.data);
    } catch (error, stackTrace) {
      Logger.errorLog(
        target: "TodoListApiServices/deleteTodoList()",
        error: error,
        stackTrace: stackTrace,
      );
      return EmptyResponseDto.init();
    }
  }
}
