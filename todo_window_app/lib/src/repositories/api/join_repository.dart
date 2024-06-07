// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_window_app/src/custom_error/custom_error.dart';
import 'package:todo_window_app/src/dto/response/join_response_dto.dart';
import 'package:todo_window_app/src/services/api/join_api_service.dart';
import 'package:todo_window_app/src/services/local/log_file_service.dart';

class JoinRepository {
  final JoinAPIService joinAPIService;
  final LogFileService logFileService;
  JoinRepository({
    required this.joinAPIService,
    required this.logFileService,
  });

  Future<JoinResponseDto> join(Map<String, dynamic> json) async {
    try {
      final JoinResponseDto res = await joinAPIService.join(json);
      return res;
    } catch (error, stackTrace) {
      logFileService.errorLog(
          target: "JoinRepository/join()",
          error: error,
          stackTrace: stackTrace);
      throw CustomError(error: error.toString());
    }
  }
}
