import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/const/const.dart';

part 'dio_provider.g.dart';

@Riverpod(dependencies: [])
Dio dio(DioRef ref) {
  final options = BaseOptions(baseUrl: pBaseUrl);
  return Dio(options);
}

String dioError(Response res) {
  final code = res.statusCode;
  final msg = res.statusMessage;

  final String errorMsg =
      "====Request Failed====\nStatus Code: $code\nMessage: $msg";
  return errorMsg;
}
