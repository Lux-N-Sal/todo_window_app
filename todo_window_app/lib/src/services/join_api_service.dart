// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:todo_window_app/src/response/join_response.dart';
import 'package:todo_window_app/src/services/providers/dio_provider.dart';

class JoinAPIService {
  final Dio dio;
  JoinAPIService({
    required this.dio,
  });

  Future<JoinResponse> join(Map<String, dynamic> json) async {
    try {
      final Response res = await dio.post("/v1/user/join", data: json);

      if (res.statusCode != 200) {
        throw dioError(res);
      }

      final joinRes = JoinResponse.toJson(res.data);

      return joinRes;
    } catch (e, s) {
      print("error: ${e.toString()}\ns: ${s.toString()}");
      rethrow;
    }
  }
}
