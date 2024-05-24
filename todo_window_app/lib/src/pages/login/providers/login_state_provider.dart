import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/pages/login/login_state.dart';

part 'login_state_provider.g.dart';

@riverpod
class Login extends _$Login {
  @override
  LoginState build() {
    return LoginState.init();
  }

  void setId(String id) {
    state = state.copyWith(id: id);
  }

  void setPw(String pw) {
    state = state.copyWith(pw: pw);
  }
}

@Riverpod(dependencies: [])
LoginState loginState(LoginStateRef ref) {
  throw UnimplementedError();
}
