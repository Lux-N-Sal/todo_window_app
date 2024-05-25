import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/enum/api.dart';
import 'package:todo_window_app/src/pages/login/providers/state/login_state.dart';
import 'package:todo_window_app/src/repositories/provider/login_repository_provider.dart';

part 'login_provider.g.dart';

@riverpod
class LoginViewmodel extends _$LoginViewmodel {
  @override
  LoginState build() {
    return LoginState.init();
  }

  void isLoadingStart() {
    state = state.copyWith(isLoading: true);
  }

  void isLoadingEnd() {
    state = state.copyWith(isLoading: false);
  }

  void onChange(bool isNotEmpty) {
    state = state.copyWith(isNotEmpty: isNotEmpty);
  }

  void goHomePage(WidgetRef ref) {
    Navigator.pushReplacementNamed(ref.context, '/home');
  }
}

@riverpod
class AsyncLogin extends _$AsyncLogin {
  @override
  FutureOr<bool> build() {
    return Future.value(false);
  }

  Future<void> login(Map<String, dynamic> json) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final res = await ref.read(loginRepositoryProvider).login(json);
      return res.resultType == APIResult.s.getString();
    });
  }
}
