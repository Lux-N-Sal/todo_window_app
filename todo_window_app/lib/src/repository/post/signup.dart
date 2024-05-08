import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/repository/provider/dio.dart';

part 'signup.g.dart';

@riverpod
class RequestSignUp extends _$RequestSignUp {
  @override
  FutureOr<String> build() {
    return "";
  }

  Future<dynamic> signUp(Map<String, dynamic> json) async {
    final res = await ref.read(dioProvider).post("join", data: json);
    log(res.data.toString());
    return res.data;
  }
}
