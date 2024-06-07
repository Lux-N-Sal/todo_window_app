import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/enum/enum_file_name.dart';
import 'package:todo_window_app/src/services/local/provider/local_file_service_provider.dart';
import 'package:todo_window_app/src/services/local/provider/log_file_service_provider.dart';
import 'package:todo_window_app/src/services/local/setting_file_service.dart';

part 'save_file_service_provider.g.dart';

@Riverpod(dependencies: [localFileService, logFileService])
SettingFileService saveFileService(SaveFileServiceRef ref) {
  return SettingFileService(
    localFileService: ref.watch(localFileServiceProvider(FileName.setting)),
    logFileService: ref.watch(logFileServiceProvider),
  );
}
