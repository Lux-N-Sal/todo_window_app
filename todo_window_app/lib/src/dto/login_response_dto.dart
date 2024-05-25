import 'package:todo_window_app/src/dto/base_response_dto.dart';

class LoginResponseDto extends BaseResponseDto<String> {
  LoginResponseDto(
      {required super.resultType,
      required super.errorId,
      required super.error,
      required super.body});
  factory LoginResponseDto.toJson(Map<String, dynamic> json) =>
      LoginResponseDto(
        resultType: json['resultType'] ?? "",
        errorId: json['errorId'] ?? "",
        error: json['error'] ?? "",
        body: json['body'] ?? "",
      );

  factory LoginResponseDto.init() => LoginResponseDto(
        resultType: "",
        errorId: "",
        error: "",
        body: "",
      );
}
