import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio.g.dart';

@riverpod
Dio dio(DioRef ref) {
  const endpoint = "http://localhost:8080/api/v1/user/";
  return Dio(
    BaseOptions(baseUrl: endpoint),
  );
}
