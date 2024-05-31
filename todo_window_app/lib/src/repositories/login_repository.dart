// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_window_app/src/custom_error/custom_error.dart';
import 'package:todo_window_app/src/dto/response/login_response_dto.dart';
import 'package:todo_window_app/src/services/login_api_service.dart';

class LoginRepository {
  final LoginAPIService loginAPIService;
  LoginRepository({
    required this.loginAPIService,
  });

  Future<LoginResponseDto> login(Map<String, dynamic> json) async {
    try {
      /// 로그인 진행
      final LoginResponseDto res = await loginAPIService.login(json);

      return res;
    } catch (e) {
      throw CustomError(error: e.toString());
    }
  }
}
