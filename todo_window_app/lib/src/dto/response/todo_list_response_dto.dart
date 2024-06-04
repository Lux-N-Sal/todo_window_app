// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_window_app/src/dto/response/base_response_dto.dart';
import 'package:todo_window_app/src/pages/home/provider/state/todo_list_state.dart';

class TodoListsResponseDto extends BaseResponseDto<List<TodoListState>> {
  TodoListsResponseDto(
      {required super.resultType,
      required super.errorId,
      required super.error,
      required super.body});

  factory TodoListsResponseDto.fromJson(Map<String, dynamic> json) =>
      TodoListsResponseDto(
        resultType: json['resultType'] ?? "",
        errorId: json['errorId'] ?? "",
        error: json['error'] ?? "",
        body: [
          for (var bJson in json['body']['toDoListDto'])
            TodoListState.fromJson(bJson)
        ],
      );

  factory TodoListsResponseDto.init() => TodoListsResponseDto(
        resultType: "",
        errorId: "",
        error: "",
        body: [],
      );
}

class TodoListResponseDto extends BaseResponseDto<TodoListState> {
  TodoListResponseDto(
      {required super.resultType,
      required super.errorId,
      required super.error,
      required super.body});

  factory TodoListResponseDto.init() => TodoListResponseDto(
      resultType: "", errorId: "", error: "", body: TodoListState.init());

  factory TodoListResponseDto.fromJson(Map<String, dynamic> json) =>
      TodoListResponseDto(
        resultType: json['resultType'] ?? "",
        errorId: json['errorId'] ?? "",
        error: json['error'] ?? "",
        body: TodoListState.fromJson(json['body']),
      );
}
