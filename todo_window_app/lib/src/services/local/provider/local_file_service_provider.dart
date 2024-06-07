import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/enum/enum_file_name.dart';
import 'package:todo_window_app/src/services/local/local_file_service.dart';
import 'package:todo_window_app/src/services/local/provider/log_file_service_provider.dart';

part 'local_file_service_provider.g.dart';

@Riverpod(dependencies: [logFileService])
LocalFileService localFileService(LocalFileServiceRef ref, FileName fileName) {
  return LocalFileService(
      fileName: fileName, logFileService: ref.watch(logFileServiceProvider));
}
