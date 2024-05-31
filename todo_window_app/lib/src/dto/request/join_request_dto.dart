// ignore_for_file: public_member_api_docs, sort_constructors_first
class JoinRequestDto {
  final String loginId;
  final String userName;
  final String loginPw;
  final String userEmail;
  JoinRequestDto({
    required this.loginId,
    required this.userName,
    required this.loginPw,
    required this.userEmail,
  });

  JoinRequestDto copyWith({
    String? loginId,
    String? userName,
    String? loginPw,
    String? userEmail,
  }) {
    return JoinRequestDto(
      loginId: loginId ?? this.loginId,
      userName: userName ?? this.userName,
      loginPw: loginPw ?? this.loginPw,
      userEmail: userEmail ?? this.userEmail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loginId': loginId,
      'userName': userName,
      'loginPw': loginPw,
      'userEmail': userEmail,
    };
  }

  factory JoinRequestDto.fromMap(Map<String, dynamic> map) {
    return JoinRequestDto(
      loginId: map['loginId'] as String,
      userName: map['userName'] as String,
      loginPw: map['loginPw'] as String,
      userEmail: map['userEmail'] as String,
    );
  }
}
