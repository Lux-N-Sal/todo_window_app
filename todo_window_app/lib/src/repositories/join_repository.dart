// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_window_app/src/custom_error/custom_error.dart';
import 'package:todo_window_app/src/dto/response/join_response_dto.dart';
import 'package:todo_window_app/src/services/join_api_service.dart';

class JoinRepository {
  final JoinAPIService joinAPIService;
  JoinRepository({
    required this.joinAPIService,
  });

  Future<JoinResponseDto> join(Map<String, dynamic> json) async {
    try {
      final JoinResponseDto res = await joinAPIService.join(json);
      return res;
    } catch (e) {
      throw CustomError(error: e.toString());
    }
  }
}
