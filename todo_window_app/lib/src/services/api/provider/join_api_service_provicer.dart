import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/services/api/join_api_service.dart';
import 'package:todo_window_app/src/services/api/provider/dio_provider.dart';
import 'package:todo_window_app/src/services/local/provider/log_file_service_provider.dart';

part 'join_api_service_provicer.g.dart';

@Riverpod(dependencies: [dio, logFileService])
JoinAPIService joinAPIService(JoinAPIServiceRef ref) {
  return JoinAPIService(
      dio: ref.watch(dioProvider),
      logFileService: ref.watch(logFileServiceProvider));
}
