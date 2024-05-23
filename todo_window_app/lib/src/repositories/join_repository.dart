// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_window_app/src/response/join_response.dart';
import 'package:todo_window_app/src/services/join_api_service.dart';

class JoinRepository {
  final JoinAPIService joinAPIService;
  JoinRepository({
    required this.joinAPIService,
  });

  Future<JoinResponse> join(Map<String, dynamic> json) async {
    try {
      final JoinResponse res = await joinAPIService.join(json);
      return res;
    } catch (e) {
      return JoinResponse.init();
    }
  }
}
