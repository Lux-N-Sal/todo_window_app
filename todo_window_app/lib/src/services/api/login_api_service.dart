// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:todo_window_app/src/dto/response/login_response_dto.dart';
import 'package:todo_window_app/src/enum/endpoint_enum.dart';
import 'package:todo_window_app/src/services/api/provider/dio_provider.dart';
import 'package:todo_window_app/src/services/local/log_file_service.dart';

class LoginAPIService {
  final Dio dio;
  final LogFileService logFileService;
  LoginAPIService({
    required this.dio,
    required this.logFileService,
  });

  Future<LoginResponseDto> login(Map<String, dynamic> json) async {
    try {
      final Response res = await dio.post(Endpoint.login.getPath(), data: json);

      if (res.statusCode != 200) {
        throw dioError(res);
      }

      final joinRes = LoginResponseDto.fromJson(res.data);

      return joinRes;
    } catch (error, stackTrace) {
      logFileService.errorLog(
          target: "LoginAPIService", error: error, stackTrace: stackTrace);
      rethrow;
    }
  }
}
