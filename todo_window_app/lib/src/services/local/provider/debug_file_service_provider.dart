import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/enum/enum_file_name.dart';
import 'package:todo_window_app/src/services/local/local_file_service.dart';

part 'debug_file_service_provider.g.dart';

@Riverpod(dependencies: [])
LocalFileService debugFileService(DebugFileServiceRef ref) {
  return LocalFileService(fileName: FileName.logdebug);
}
