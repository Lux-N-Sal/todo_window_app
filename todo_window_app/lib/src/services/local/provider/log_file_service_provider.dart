import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/services/local/log_file_service.dart';
import 'package:todo_window_app/src/services/local/provider/debug_file_service_provider.dart';

part 'log_file_service_provider.g.dart';

@Riverpod(dependencies: [debugFileService])
LogFileService logFileService(LogFileServiceRef ref) {
  return LogFileService(localFileService: ref.watch(debugFileServiceProvider));
}
