import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/repositories/api/login_repository.dart';
import 'package:todo_window_app/src/services/api/provider/login_api_service_provider.dart';
import 'package:todo_window_app/src/services/local/provider/log_file_service_provider.dart';

part 'login_repository_provider.g.dart';

@Riverpod(dependencies: [loginAPIService, logFileService])
LoginRepository loginRepository(LoginRepositoryRef ref) {
  return LoginRepository(
      loginAPIService: ref.watch(loginAPIServiceProvider),
      logFileService: ref.watch(logFileServiceProvider));
}
