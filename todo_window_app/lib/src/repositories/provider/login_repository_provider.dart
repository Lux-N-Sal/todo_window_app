import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/repositories/login_repository.dart';
import 'package:todo_window_app/src/services/providers/login_api_service_provider.dart';

part 'login_repository_provider.g.dart';

@riverpod
LoginRepository loginRepository(LoginRepositoryRef ref) {
  return LoginRepository(loginAPIService: ref.watch(loginAPIServiceProvider));
}
