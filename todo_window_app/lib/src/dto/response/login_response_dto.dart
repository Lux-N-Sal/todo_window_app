// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_window_app/src/dto/response/base_response_dto.dart';

class LoginResponseDto extends BaseResponseDto<LoginBody> {
  LoginResponseDto(
      {required super.resultType,
      required super.errorId,
      required super.error,
      required super.body});
  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      LoginResponseDto(
        resultType: json['resultType'] ?? "",
        errorId: json['errorId'] ?? "",
        error: json['error'] ?? "",
        body: LoginBody.fromJson(json['body']),
      );

  factory LoginResponseDto.init() => LoginResponseDto(
        resultType: "",
        errorId: "",
        error: "",
        body: LoginBody.init(),
      );
}

class LoginBody {
  final String sessionId;
  LoginBody({
    required this.sessionId,
  });

  factory LoginBody.fromJson(Map<String, dynamic> json) =>
      LoginBody(sessionId: json["sessionId"] ?? "");

  factory LoginBody.init() => LoginBody(sessionId: "");

  LoginBody copyWith({
    String? sessionId,
  }) {
    return LoginBody(
      sessionId: sessionId ?? this.sessionId,
    );
  }
}
