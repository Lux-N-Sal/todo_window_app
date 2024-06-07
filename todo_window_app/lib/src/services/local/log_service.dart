// import 'dart:async';
// import 'dart:collection';
// import 'dart:developer';
// import 'dart:io';

// import 'package:intl/intl.dart';
// import 'package:todo_window_app/src/enum/enum_file_name.dart';
// import 'package:todo_window_app/src/services/local/localfile_service.dart';

// class Logger {
//   /// 로그 작업 큐에 넣어서 관리
//   static final Queue<Future> _logQueue = Queue<Future>();
//   static Future<void> _queueLock = Future<void>.value();

//   static Future<void> _enqueueLog(Future<void> Function() logTask) async {
//     Completer<void> completer = Completer<void>();
//     _logQueue.addLast(completer.future);

//     await _queueLock;
//     _queueLock = logTask().whenComplete(() {
//       completer.complete();
//       _logQueue.removeFirst();
//     }).catchError((error) {
//       log(error.toString());
//       completer.completeError(error);
//       _logQueue.removeFirst();
//     });
//   }

//   /// 로그를 남기는 함수
//   /// logLevel: 로그레벨에 관한 값
//   /// message: 로그에 남길 메시지에 관한 값
//   static void setLog({
//     required LogLevel logLevel,
//     required FileName fileName,
//     required String target,
//     required String message,
//   }) {
//     _enqueueLog(
//       () async {
//         File logFile =
//             await LocalDataService.getInstance(fileName: fileName).localFile;

//         final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
//         final timestamp = dateFormat.format(DateTime.now());
//         final logMessage =
//             '$timestamp [${logLevel.getString()}] $target :: $message\n';
//         log(logMessage);
//         await logFile.writeAsString(logMessage, mode: FileMode.append);
//       },
//     );
//   }

//   /// 디버깅 로그
//   static void debugLog({
//     required String target,
//     String message = "",
//   }) =>
//       setLog(
//         logLevel: LogLevel.debug,
//         fileName: FileName.logdebug,
//         target: target,
//         message: message,
//       );

//   /// 정보 로그
//   static void infoLog({
//     required String target,
//     String message = "",
//   }) =>
//       setLog(
//         logLevel: LogLevel.info,
//         fileName: FileName.logdebug,
//         target: target,
//         message: message,
//       );

//   /// 에러 로그
//   static void errorLog({
//     required String target,
//     required Object error,
//     required StackTrace stackTrace,
//   }) =>
//       setLog(
//         logLevel: LogLevel.error,
//         fileName: FileName.logdebug,
//         target: target,
//         message:
//             "ERROR : ${error.toString()}\n STACKTRACE : ${stackTrace.toString()}",
//       );

//   static void customErrorLog({
//     required String target,
//     required String message,
//   }) =>
//       setLog(
//         logLevel: LogLevel.error,
//         fileName: FileName.logdebug,
//         target: target,
//         message: message,
//       );

//   /// 경로 로그
//   static void warningLog({
//     required String target,
//     String message = "",
//   }) =>
//       setLog(
//         logLevel: LogLevel.warn,
//         fileName: FileName.logdebug,
//         target: target,
//         message: message,
//       );
// }

// enum LogLevel {
//   debug,
//   info,
//   warn,
//   error,
//   fatal;

//   String getString() {
//     switch (this) {
//       case LogLevel.debug:
//         return "DEBUG";
//       case LogLevel.info:
//         return "INFO";
//       case LogLevel.warn:
//         return "WARN";
//       case LogLevel.error:
//         return "ERROR";
//       case LogLevel.fatal:
//         return "FATAL";
//     }
//   }
// }
