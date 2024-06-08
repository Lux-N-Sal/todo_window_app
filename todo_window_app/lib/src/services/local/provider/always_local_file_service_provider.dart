import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/enum/enum_file_name.dart';
import 'package:todo_window_app/src/services/local/local_file_service.dart';

part 'always_local_file_service_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
LocalFileService alwaysLocalFileService(
    AlwaysLocalFileServiceRef ref, FileName fileName) {
  return LocalFileService(fileName: fileName);
}
