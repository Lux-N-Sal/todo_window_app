import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/services/join_api_service.dart';
import 'package:todo_window_app/src/services/providers/dio_provider.dart';

part 'join_api_service_provicer.g.dart';

@riverpod
JoinAPIService joinAPIService(JoinAPIServiceRef ref) {
  return JoinAPIService(dio: ref.watch(dioProvider));
}
