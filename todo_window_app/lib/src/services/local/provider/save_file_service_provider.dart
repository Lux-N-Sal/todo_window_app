import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/services/local/provider/log_file_service_provider.dart';
import 'package:todo_window_app/src/services/local/provider/setting_file_service_provier.dart';
import 'package:todo_window_app/src/services/local/setting_file_service.dart';

part 'save_file_service_provider.g.dart';

@Riverpod(dependencies: [settingFileService, logFileService])
SettingFileService saveFileService(SaveFileServiceRef ref) {
  return SettingFileService(
    localFileService: ref.watch(settingFileServiceProvider),
    logFileService: ref.watch(logFileServiceProvider),
  );
}
