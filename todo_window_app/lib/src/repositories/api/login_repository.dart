// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_window_app/src/custom_error/custom_error.dart';
import 'package:todo_window_app/src/dto/response/login_response_dto.dart';
import 'package:todo_window_app/src/services/api/login_api_service.dart';
import 'package:todo_window_app/src/services/local/log_file_service.dart';

class LoginRepository {
  final LoginAPIService loginAPIService;
  final LogFileService logFileService;
  LoginRepository({
    required this.loginAPIService,
    required this.logFileService,
  });

  Future<LoginResponseDto> login(Map<String, dynamic> json) async {
    try {
      /// 로그인 진행
      final LoginResponseDto res = await loginAPIService.login(json);

      return res;
    } catch (error, stackTrace) {
      logFileService.errorLog(
          target: "LoginRepository/login()",
          error: error,
          stackTrace: stackTrace);
      throw CustomError(error: error.toString());
    }
  }
}
