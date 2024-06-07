import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/enum/enum_file_name.dart';
import 'package:todo_window_app/src/services/local/log_file_service.dart';
import 'package:todo_window_app/src/services/local/provider/always_local_file_service_provider.dart';

part 'always_log_file_service_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [alwaysLocalFileService])
LogFileService alwaysLogFileService(AlwaysLogFileServiceRef ref) {
  return LogFileService(
      localFileService:
          ref.watch(alwaysLocalFileServiceProvider(FileName.logdebug)));
}
