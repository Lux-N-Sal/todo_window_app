import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/pages/join/provider/state/sign_up_state.dart';

part 'sign_up_provider.g.dart';

@riverpod
class SignUp extends _$SignUp {
  @override
  SignUpState build() {
    return SignUpState.init();
  }

  void setId(String id) {
    state = state.copyWith(id: id);
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setPasswordCheck(String passwordCheck) {
    state = state.copyWith(passwordCheck: passwordCheck);
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }
}

@Riverpod(dependencies: [])
SignUpState signUpText(SignUpTextRef ref) {
  throw UnimplementedError();
}
