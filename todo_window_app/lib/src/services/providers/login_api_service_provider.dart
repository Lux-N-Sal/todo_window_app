import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/services/login_api_service.dart';
import 'package:todo_window_app/src/services/providers/dio_provider.dart';

part 'login_api_service_provider.g.dart';

@riverpod
LoginAPIService loginAPIService(LoginAPIServiceRef ref) {
  return LoginAPIService(dio: ref.watch(dioProvider));
}
