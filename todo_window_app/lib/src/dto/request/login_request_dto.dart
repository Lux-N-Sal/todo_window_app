// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginRequestDto {
  final String loginId;
  final String loginPw;
  LoginRequestDto({
    required this.loginId,
    required this.loginPw,
  });

  LoginRequestDto copyWith({
    String? loginId,
    String? loginPw,
  }) {
    return LoginRequestDto(
      loginId: loginId ?? this.loginId,
      loginPw: loginPw ?? this.loginPw,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loginId': loginId,
      'loginPw': loginPw,
    };
  }
}
