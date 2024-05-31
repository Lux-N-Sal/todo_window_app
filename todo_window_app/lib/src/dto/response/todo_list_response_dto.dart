// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_window_app/src/dto/response/base_response_dto.dart';
import 'package:todo_window_app/src/pages/home/provider/state/todo_list_state.dart';

class GetTodoListResponseDto extends BaseResponseDto<List<TodoListState>> {
  GetTodoListResponseDto(
      {required super.resultType,
      required super.errorId,
      required super.error,
      required super.body});

  factory GetTodoListResponseDto.fromJson(Map<String, dynamic> json) =>
      GetTodoListResponseDto(
        resultType: json['resultType'] ?? "",
        errorId: json['errorId'] ?? "",
        error: json['error'] ?? "",
        body: [
          for (var bJson in json['body']['toDoListDto'])
            TodoListState.fromJson(bJson)
        ],
      );

  factory GetTodoListResponseDto.init() => GetTodoListResponseDto(
        resultType: "",
        errorId: "",
        error: "",
        body: [],
      );
}
