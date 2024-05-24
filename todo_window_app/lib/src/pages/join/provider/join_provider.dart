import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/pages/join/provider/state/join_state.dart';
import 'package:todo_window_app/src/repositories/provider/join_repository_provider.dart';

part 'join_provider.g.dart';

@riverpod
class JoinViewmodel extends _$JoinViewmodel {
  @override
  JoinState build() {
    ref.onDispose(() {
      log("JoinProvider disposed.");
    });

    log("JoinProvider build()");
    return JoinState.init();
  }

  void onChange(bool isNotEmpty) {
    state = state.copyWith(isNotEmpty: isNotEmpty);
  }

  void loadingStart() {
    state = state.copyWith(isLoading: true);
  }

  void loadingEnd() {
    state = state.copyWith(isLoading: false);
  }
}

@riverpod
class AsyncJoin extends _$AsyncJoin {
  @override
  FutureOr<bool> build() {
    return Future.value(false);
  }

  Future<void> join(Map<String, dynamic> json) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final res = await ref.read(joinRepositoryProvider).join(json);
      return res.resultType == "S";
    });
  }
}
