import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/services/api/login_api_service.dart';
import 'package:todo_window_app/src/services/api/provider/dio_provider.dart';
import 'package:todo_window_app/src/services/local/provider/log_file_service_provider.dart';

part 'login_api_service_provider.g.dart';

@Riverpod(dependencies: [dio, logFileService])
LoginAPIService loginAPIService(LoginAPIServiceRef ref) {
  return LoginAPIService(
      dio: ref.watch(dioProvider),
      logFileService: ref.watch(logFileServiceProvider));
}
