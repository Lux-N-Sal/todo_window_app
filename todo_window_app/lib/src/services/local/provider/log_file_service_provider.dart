import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/enum/enum_file_name.dart';
import 'package:todo_window_app/src/services/local/log_file_service.dart';
import 'package:todo_window_app/src/services/local/provider/local_file_service_provider.dart';

part 'log_file_service_provider.g.dart';

@Riverpod(dependencies: [localFileService])
LogFileService logFileService(LogFileServiceRef ref) {
  return LogFileService(
      localFileService: ref.watch(localFileServiceProvider(FileName.logdebug)));
}
