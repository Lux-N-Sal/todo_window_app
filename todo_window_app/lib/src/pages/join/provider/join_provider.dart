import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/pages/join/provider/state/join_res_state.dart';
import 'package:todo_window_app/src/repositories/provider/join_repository_provider.dart';

part 'join_provider.g.dart';

// @riverpod
// class Join extends _$Join {
//   @override
//   FutureOr<JoinResponse> build() {
//     return Future.value(JoinResponse.init());
//   }

//   Future<void> join(Map<String, dynamic> json) async {
//     state = const AsyncLoading();

//     state = await AsyncValue.guard(() async {
//       final res = await ref.read(joinRepositoryProvider).join(json);
//       return res;
//     });
//   }
// }

@riverpod
class Join extends _$Join {
  @override
  JoinResState build() {
    ref.onDispose(() {
      log("JoinProvider disposed.");
    });

    log("JoinProvider build()");
    return JoinResState.init();
  }

  Future<void> join(Map<String, dynamic> json) async {
    state = state.copyWith(isLoading: true);

    final res = await ref.read(joinRepositoryProvider).join(json);

    state = state.copyWith(isLoading: false, joinResponse: res);
  }
}
