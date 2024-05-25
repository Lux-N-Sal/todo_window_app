import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/pages/login/providers/state/login_state.dart';

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
}

@riverpod
class AsyncLogin extends _$AsyncLogin {
  @override
  FutureOr<bool> build() {
    return Future.value(false);
  }
}
