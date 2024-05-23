import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/repositories/join_repository.dart';
import 'package:todo_window_app/src/services/providers/join_api_service_provicer.dart';

part 'join_repository_provider.g.dart';

@riverpod
JoinRepository joinRepository(JoinRepositoryRef ref) {
  return JoinRepository(joinAPIService: ref.watch(joinAPIServiceProvider));
}
