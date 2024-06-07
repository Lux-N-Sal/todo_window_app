import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/repositories/api/join_repository.dart';
import 'package:todo_window_app/src/services/api/provider/join_api_service_provicer.dart';
import 'package:todo_window_app/src/services/local/provider/log_file_service_provider.dart';

part 'join_repository_provider.g.dart';

@Riverpod(dependencies: [joinAPIService, logFileService])
JoinRepository joinRepository(JoinRepositoryRef ref) {
  return JoinRepository(
      joinAPIService: ref.watch(joinAPIServiceProvider),
      logFileService: ref.watch(logFileServiceProvider));
}
