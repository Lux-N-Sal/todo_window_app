// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:todo_window_app/src/dto/response/todo_list_response_dto.dart';
import 'package:todo_window_app/src/enum/endpoint_enum.dart';
import 'package:todo_window_app/src/services/log_service.dart';
import 'package:todo_window_app/src/services/providers/dio_provider.dart';

class TodoListApiServices {
  Dio dio;
  TodoListApiServices({
    required this.dio,
  });
  Future<GetTodoListResponseDto> getTodos({required String jwt}) async {
    try {
      final Response res = await dio.get(
        Endpoint.getTodos.getPath(),
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
      return GetTodoListResponseDto.fromJson(res.data);
    } catch (error, stackTrace) {
      Logger.errorLog(
        target: "TodoListApiServices/getTodos()",
        error: error,
        stackTrace: stackTrace,
      );
      return GetTodoListResponseDto.init();
    }
  }
}
