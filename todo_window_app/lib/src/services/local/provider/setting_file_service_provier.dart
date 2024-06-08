import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/enum/enum_file_name.dart';
import 'package:todo_window_app/src/services/local/local_file_service.dart';

part 'setting_file_service_provier.g.dart';

@Riverpod(dependencies: [])
LocalFileService settingFileService(SettingFileServiceRef ref) {
  return LocalFileService(fileName: FileName.setting);
}
