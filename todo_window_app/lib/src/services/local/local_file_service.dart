// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:todo_window_app/src/enum/enum_file_name.dart';
import 'package:todo_window_app/src/services/local/log_file_service.dart';

class LocalFileService {
  final FileName fileName;
  final LogFileService logFileService;

  LocalFileService({
    required this.fileName,
    required this.logFileService,
  });

  // 로컬 경로 가져오기
  Future<String> get _localPath async {
    final docDir = await getApplicationDocumentsDirectory();

    final dir =
        Directory("${docDir.path}\\..\\${FileName.folderTodo.getString()}");

    // acra 폴더 있는지 체크, 없으면 생성
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir.path;
  }

  Future<File> get localFile async {
    /// 파일이 생성되는 경로
    /// C:\Users\User\.acrapoint\파일명
    final path = await _localPath;
    final file = File("$path\\${fileName.getString()}");

    /// 해당 파일이 없다면 생성
    if (!await file.exists()) {
      logFileService.customErrorLog(
        target: "LocalDataService/get localFile",
        message: "File Not Found : ${file.path}",
      );
      try {
        await file.create();
      } catch (e, s) {
        /// 에러나면 로그
        logFileService.errorLog(
          target: "LocalDataService/get localFile",
          error: e,
          stackTrace: s,
        );
      }
    }
    return file;
  }

  Future<String> readFile() async {
    try {
      final file = await localFile;

      /// 존재하는 파일인지 검사
      if (!file.existsSync()) {
        logFileService.customErrorLog(
          target: "LocalDataService/readFile()",
          message: "File Not Found : ${file.path}",
        );
        return "";
      }

      String data = await file.readAsString();
      return data;
    } catch (e, s) {
      logFileService.errorLog(
        target: "LocalDataService/readFile()",
        error: e,
        stackTrace: s,
      );
      return "";
    }
  }

  /// Json 파일을 읽는 함수
  /// Json 파일이 없거나 파일 형식이 Json이 아닌경우
  /// 에러 로그를 기록하고 null을 반환한다.
  Future<Map<String, dynamic>?> readFileFromJson() async {
    try {
      final file = await localFile;

      /// 존재하는 파일인지 검사
      if (!file.existsSync()) {
        print("file not found? ${file.existsSync().toString()}");
        logFileService.customErrorLog(
          target: "LocalDataService/readFileFromJson()",
          message: "File Not Found : ${file.path}",
        );
        return null;
      }

      String data = await file.readAsString();
      return json.decode(data);
    } catch (e, s) {
      logFileService.errorLog(
        target: "LocalDataService/readFileFromJson()",
        error: e,
        stackTrace: s,
      );
      return null;
    }
  }

  Future<File> writeFileToJson(Map<String, dynamic> jsonMap) async {
    try {
      final file = await localFile;
      String jsonString = json.encode(jsonMap);
      print("writeFileToJson() : $jsonString");
      return file.writeAsString(jsonString);
    } catch (e, s) {
      logFileService.errorLog(
        target: "LocalfileService/writeFileToJson()",
        error: e,
        stackTrace: s,
      );
      return File("$_localPath\\e.txt");
    }
  }
}
