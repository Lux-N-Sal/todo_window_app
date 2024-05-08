class SignUpState {
  final String id;
  final String password;
  final String passwordCheck;
  final String name;
  final String email;
  SignUpState({
    required this.id,
    required this.password,
    required this.passwordCheck,
    required this.name,
    required this.email,
  });

  factory SignUpState.init() => SignUpState(
        id: "",
        password: "",
        passwordCheck: "",
        name: "",
        email: "",
      );

  SignUpState copyWith({
    String? id,
    String? password,
    String? passwordCheck,
    String? name,
    String? email,
  }) {
    return SignUpState(
      id: id ?? this.id,
      password: password ?? this.password,
      passwordCheck: passwordCheck ?? this.passwordCheck,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
