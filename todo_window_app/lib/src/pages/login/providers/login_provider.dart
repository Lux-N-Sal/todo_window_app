import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/dto/response/todo_list_response_dto.dart';
import 'package:todo_window_app/src/enum/api.dart';
import 'package:todo_window_app/src/pages/home/provider/session_provider.dart';
import 'package:todo_window_app/src/pages/home/provider/todo_list_provider.dart';
import 'package:todo_window_app/src/pages/login/providers/state/login_state.dart';
import 'package:todo_window_app/src/repositories/api/provider/login_repository_provider.dart';
import 'package:todo_window_app/src/repositories/api/provider/todo_list_repository_provider.dart';

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

@Riverpod(dependencies: [todoListRepository, TodoList])
class AsyncLogin extends _$AsyncLogin {
  @override
  FutureOr<bool> build() {
    return Future.value(false);
  }

  Future<void> login(Map<String, dynamic> json) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final loginRes = await ref.read(loginRepositoryProvider).login(json);
      if (loginRes.resultType == APIResult.s.getString()) {
        final jwt = loginRes.body.sessionId;

        /// jwt 저장
        ref.read(sessionProvider.notifier).set(jwt);

        /// 투두리스트 읽기
        final TodoListsResponseDto todosRes =
            await ref.read(todoListRepositoryProvider).getTodoLists(jwt: jwt);
        print("todos:${todosRes.resultType}");
        print(todosRes.error);
        if (todosRes.resultType == APIResult.s.getString()) {
          ref.read(todoListProvider.notifier).set(todosRes.body);
          return true;
        }
      }
      return false;
    });
  }
}
