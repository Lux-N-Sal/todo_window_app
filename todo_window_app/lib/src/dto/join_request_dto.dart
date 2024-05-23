class JoinRequestDto {
  final String loginId;
  final String userName;
  final String loginPw;
  final String loginPwCheck;
  final String userEmail;
  JoinRequestDto({
    required this.loginId,
    required this.userName,
    required this.loginPw,
    required this.loginPwCheck,
    required this.userEmail,
  });

  JoinRequestDto copyWith({
    String? loginId,
    String? userName,
    String? loginPw,
    String? loginPwCheck,
    String? userEmail,
  }) {
    return JoinRequestDto(
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

  factory JoinRequestDto.fromMap(Map<String, dynamic> map) {
    return JoinRequestDto(
      loginId: map['loginId'] as String,
      userName: map['userName'] as String,
      loginPw: map['loginPw'] as String,
      loginPwCheck: map['loginPwCheck'] as String,
      userEmail: map['userEmail'] as String,
    );
  }
}
