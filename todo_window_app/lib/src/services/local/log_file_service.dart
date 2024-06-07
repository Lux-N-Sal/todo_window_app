// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:collection';
import 'dart:developer';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:todo_window_app/src/enum/enum_log_level.dart';
import 'package:todo_window_app/src/services/local/local_file_service.dart';

class LogFileService {
  final LocalFileService localFileService;
  LogFileService({
    required this.localFileService,
  });

  /// 로그 작업 큐에 넣어서 관리
  final Queue<Future> _logQueue = Queue<Future>();
  Future<void> _queueLock = Future<void>.value();

  Future<void> _enqueueLog(Future<void> Function() logTask) async {
    Completer<void> completer = Completer<void>();
    _logQueue.addLast(completer.future);

    await _queueLock;
    _queueLock = logTask().whenComplete(() {
      completer.complete();
      _logQueue.removeFirst();
    }).catchError((error) {
      log(error.toString());
      completer.completeError(error);
      _logQueue.removeFirst();
    });
  }

  /// 로그를 남기는 함수
  /// logLevel: 로그레벨에 관한 값
  /// message: 로그에 남길 메시지에 관한 값
  void setLog({
    required LogLevel logLevel,
    required String target,
    required String message,
  }) {
    _enqueueLog(
      () async {
        File logFile = await localFileService.localFile;

        final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
        final timestamp = dateFormat.format(DateTime.now());
        final logMessage =
            '[$timestamp][${logLevel.getString()}] $target :: $message\n';
        log(logMessage);
        print(logMessage);
        await logFile.writeAsString(logMessage, mode: FileMode.append);
      },
    );
  }

  /// 디버깅 로그
  void debugLog({
    required String target,
    String message = "",
  }) =>
      setLog(
        logLevel: LogLevel.debug,
        target: target,
        message: message,
      );

  /// 정보 로그
  void infoLog({
    required String target,
    String message = "",
  }) =>
      setLog(
        logLevel: LogLevel.info,
        target: target,
        message: message,
      );

  /// 에러 로그
  void errorLog({
    required String target,
    required Object error,
    required StackTrace stackTrace,
  }) =>
      setLog(
        logLevel: LogLevel.error,
        target: target,
        message:
            "ERROR : ${error.toString()}\n STACKTRACE : ${stackTrace.toString()}",
      );

  void customErrorLog({
    required String target,
    required String message,
  }) =>
      setLog(
        logLevel: LogLevel.error,
        target: target,
        message: message,
      );

  /// 경로 로그
  void warningLog({
    required String target,
    String message = "",
  }) =>
      setLog(
        logLevel: LogLevel.warn,
        target: target,
        message: message,
      );
}
