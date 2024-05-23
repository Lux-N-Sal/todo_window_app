import 'package:todo_window_app/src/response/base_response.dart';

class JoinResponse extends BaseResponse<String> {
  JoinResponse({
    required super.resultType,
    required super.errorId,
    required super.error,
    required super.body,
  });

  factory JoinResponse.toJson(Map<String, dynamic> json) => JoinResponse(
        resultType: json['resultType'] ?? "",
        errorId: json['errorId'] ?? "",
        error: json['error'] ?? "",
        body: json['body'] ?? "",
      );

  factory JoinResponse.init() =>
      JoinResponse(resultType: "", errorId: "", error: "", body: "");
}
