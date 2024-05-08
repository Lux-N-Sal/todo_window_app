class SignUpRequestDto {
  final String loginId;
  final String userName;
  final String loginPw;
  final String loginPwCheck;
  final String userEmail;
  SignUpRequestDto({
    required this.loginId,
    required this.userName,
    required this.loginPw,
    required this.loginPwCheck,
    required this.userEmail,
  });

  SignUpRequestDto copyWith({
    String? loginId,
    String? userName,
    String? loginPw,
    String? loginPwCheck,
    String? userEmail,
  }) {
    return SignUpRequestDto(
      loginId: loginId ?? this.loginId,
      userName: userName ?? this.userName,
      loginPw: loginPw ?? this.loginPw,
      loginPwCheck: loginPwCheck ?? this.loginPwCheck,
      userEmail: userEmail ?? this.userEmail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loginId': loginId,
      'userName': userName,
      'loginPw': loginPw,
      'loginPwCheck': loginPwCheck,
      'userEmail': userEmail,
    };
  }

  factory SignUpRequestDto.fromMap(Map<String, dynamic> map) {
    return SignUpRequestDto(
      loginId: map['loginId'] as String,
      userName: map['userName'] as String,
      loginPw: map['loginPw'] as String,
      loginPwCheck: map['loginPwCheck'] as String,
      userEmail: map['userEmail'] as String,
    );
  }
}
