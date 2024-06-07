// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:todo_window_app/src/dto/response/join_response_dto.dart';
import 'package:todo_window_app/src/enum/endpoint_enum.dart';
import 'package:todo_window_app/src/services/api/provider/dio_provider.dart';
import 'package:todo_window_app/src/services/local/log_file_service.dart';

class JoinAPIService {
  final Dio dio;
  final LogFileService logFileService;
  JoinAPIService({
    required this.dio,
    required this.logFileService,
  });

  Future<JoinResponseDto> join(Map<String, dynamic> json) async {
    try {
      final Response res = await dio.post(Endpoint.join.getPath(), data: json);

      if (res.statusCode != 200) {
        throw dioError(res);
      }

      final joinRes = JoinResponseDto.fromJson(res.data);

      return joinRes;
    } catch (error, stackTrace) {
      logFileService.errorLog(
          target: "JoinAPIService", error: error, stackTrace: stackTrace);
      rethrow;
    }
  }
}
