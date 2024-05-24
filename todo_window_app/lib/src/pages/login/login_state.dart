// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginState {
  final String id;
  final String pw;
  LoginState({
    required this.id,
    required this.pw,
  });

  factory LoginState.init() => LoginState(id: "", pw: "");

  LoginState copyWith({
    String? id,
    String? pw,
  }) {
    return LoginState(
      id: id ?? this.id,
      pw: pw ?? this.pw,
    );
  }
}
