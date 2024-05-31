// ignore_for_file: public_member_api_docs, sort_constructors_first
class SessionState {
  final String jwt;
  SessionState({
    required this.jwt,
  });

  factory SessionState.init() => SessionState(jwt: "");

  SessionState copyWith({
    String? jwt,
  }) {
    return SessionState(
      jwt: jwt ?? this.jwt,
    );
  }
}
