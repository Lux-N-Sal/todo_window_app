// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/custom_error/custom_error.dart';
import 'package:todo_window_app/src/dto/response/todo_list_response_dto.dart';
import 'package:todo_window_app/src/enum/api.dart';
import 'package:todo_window_app/src/pages/home/provider/nav_viewmodel_provider.dart';
import 'package:todo_window_app/src/pages/home/provider/todo_list_provider.dart';
import 'package:todo_window_app/src/services/log_service.dart';
import 'package:todo_window_app/src/services/todo_list_api_services.dart';

class TodoListRepository {
  final TodoListApiServices todoListApiServices;
  TodoListRepository({
    required this.todoListApiServices,
  });

  Future<TodoListsResponseDto> getTodoLists({required String jwt}) async {
    try {
      final TodoListsResponseDto res =
          await todoListApiServices.getTodoLists(jwt: jwt);

      return res;
    } catch (error, stackTrace) {
      Logger.errorLog(
          target: "TodoListRepository/getTodoList()",
          error: error,
          stackTrace: stackTrace);
      throw CustomError(error: error.toString());
    }
  }

  Future<TodoListResponseDto> createTodoList({
    required String jwt,
    required String listName,
  }) async {
    try {
      final TodoListResponseDto res = await todoListApiServices.createTodoList(
          jwt: jwt, listName: listName);

      return res;
    } catch (error, stackTrace) {
      Logger.errorLog(
          target: "TodoListRepository/createTodoList()",
          error: error,
          stackTrace: stackTrace);
      throw CustomError(error: error.toString());
    }
  }

  Future<EmptyResponseDto> editTodoList({
    required String jwt,
    required String listId,
    required String listName,
    required WidgetRef ref,
  }) async {
    try {
      final EmptyResponseDto res = await todoListApiServices.editTodoList(
          jwt: jwt, listId: listId, listName: listName);
      if (res.resultType == APIResult.s.getString()) {
        print("수정");
        final TodoListsResponseDto todoListDto =
            await todoListApiServices.getTodoLists(jwt: jwt);
        ref.read(todoListProvider.notifier).set(todoListDto.body);
        print("리스트 수 : ${todoListDto.body.length}");
      }
      return res;
    } catch (error, stackTrace) {
      Logger.errorLog(
          target: "TodoListRepository/editTodoList()",
          error: error,
          stackTrace: stackTrace);
      throw CustomError(error: error.toString());
    }
  }

  Future<EmptyResponseDto> deleteTodoList({
    required String jwt,
    required String listId,
    required WidgetRef ref,
  }) async {
    try {
      final EmptyResponseDto res =
          await todoListApiServices.deleteTodoList(jwt: jwt, listId: listId);

      if (res.resultType == APIResult.s.getString()) {
        print("제거");
        final TodoListsResponseDto todoListDto =
            await todoListApiServices.getTodoLists(jwt: jwt);
        ref.read(todoListProvider.notifier).set(todoListDto.body);
        print("리스트 수 : ${todoListDto.body.length}");
      }
      ref.read(navViewmodelProvider.notifier).selectedIndex(-3);

      return res;
    } catch (error, stackTrace) {
      Logger.errorLog(
          target: "TodoListRepository/deleteTodoList()",
          error: error,
          stackTrace: stackTrace);
      throw CustomError(error: error.toString());
    }
  }
}
