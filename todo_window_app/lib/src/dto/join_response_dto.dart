import 'package:todo_window_app/src/dto/base_response_dto.dart';

class JoinResponseDto extends BaseResponseDto<String> {
  JoinResponseDto({
    required super.resultType,
    required super.errorId,
    required super.error,
    required super.body,
  });

  factory JoinResponseDto.toJson(Map<String, dynamic> json) => JoinResponseDto(
        resultType: json['resultType'] ?? "",
        errorId: json['errorId'] ?? "",
        error: json['error'] ?? "",
        body: json['body'] ?? "",
      );

  factory JoinResponseDto.init() =>
      JoinResponseDto(resultType: "", errorId: "", error: "", body: "");
}
