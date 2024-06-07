// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_window_app/src/enum/json_tag.dart';
import 'package:todo_window_app/src/services/local/local_file_service.dart';
import 'package:todo_window_app/src/services/local/log_file_service.dart';
import 'package:todo_window_app/style/foundation/app_theme.dart';
import 'package:todo_window_app/util/lang/provider/model/lang_state.dart';

/// 파일 저장 서비스
class SettingFileService {
  final LocalFileService localFileService;
  final LogFileService logFileService;
  SettingFileService({
    required this.localFileService,
    required this.logFileService,
  });

  void saveSettingFile({
    required AppTheme appTheme,
    required LocaleName localeName,
  }) {
    try {
      final jsonMap = {
        JsonTag.theme.getString(): appTheme.mode.getString(),
        JsonTag.language.getString(): localeName.getString(),
      };
      localFileService.writeFileToJson(jsonMap);
    } catch (error, stackTrace) {
      logFileService.errorLog(
        target: "SaveFileService.saveSettingFile()",
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
