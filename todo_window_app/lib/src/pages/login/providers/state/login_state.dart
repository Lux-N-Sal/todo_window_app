// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_window_app/src/pages/login/providers/state/login_textfield_state.dart';

class LoginState {
  final bool isLoading;
  final bool isNotEmpty;
  final LoginTextfieldState loginTextfieldState;
  LoginState({
    required this.isLoading,
    required this.isNotEmpty,
    required this.loginTextfieldState,
  });

  factory LoginState.init() => LoginState(
        isLoading: false,
        isNotEmpty: false,
        loginTextfieldState: LoginTextfieldState.init(),
      );

  LoginState copyWith({
    bool? isLoading,
    bool? isNotEmpty,
    LoginTextfieldState? loginTextfieldState,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isNotEmpty: isNotEmpty ?? this.isNotEmpty,
      loginTextfieldState: loginTextfieldState ?? this.loginTextfieldState,
    );
  }
}
