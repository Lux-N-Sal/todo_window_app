// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:todo_window_app/src/enum/enum_file_name.dart';

class LocalFileService {
  final FileName fileName;

  LocalFileService({
    required this.fileName,
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
      print(
          "target : LocalDataService/get localFile\nmessage : File Not Found : ${file.path}");
      try {
        await file.create();
      } catch (error, stackTrace) {
        print(
            "target : LocalDataService/get localFile\nerror : ${error.toString}\nstackTrace: ${stackTrace.toString()}");
      }
    }
    return file;
  }

  Future<String> readFile() async {
    try {
      final file = await localFile;

      /// 존재하는 파일인지 검사
      if (!file.existsSync()) {
        print(
            "target : LocalDataService/readFile()\nmessage : File Not Found : ${file.path}");
        return "";
      }

      String data = await file.readAsString();
      return data;
    } catch (error, stackTrace) {
      print(
          "target : LocalDataService/readFile()\nerror : ${error.toString}\nstackTrace: ${stackTrace.toString()}");
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
        print(
            "target : LocalDataService/readFileFromJson()\nmessage : File Not Found : ${file.path}");
        return null;
      }

      String data = await file.readAsString();
      return json.decode(data);
    } catch (error, stackTrace) {
      print(
          "target : LocalDataService/readFileFromJson()\nerror : ${error.toString}\nstackTrace: ${stackTrace.toString()}");
      return null;
    }
  }

  Future<File> writeFileToJson(Map<String, dynamic> jsonMap) async {
    try {
      final file = await localFile;
      String jsonString = json.encode(jsonMap);
      print("writeFileToJson() : $jsonString");
      return file.writeAsString(jsonString);
    } catch (error, stackTrace) {
      print(
          "target : LocalDataService/writeFileToJson()\nerror : ${error.toString}\nstackTrace: ${stackTrace.toString()}");
      return File("$_localPath\\e.txt");
    }
  }
}
