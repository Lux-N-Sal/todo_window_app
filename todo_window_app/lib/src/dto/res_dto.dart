// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResDto<T> {
  final String resultType;
  final String errorCode;
  final String error;
  final T body;
  ResDto({
    required this.resultType,
    required this.errorCode,
    required this.error,
    required this.body,
  });

  ResDto<T> copyWith({
    String? resultType,
    String? errorCode,
    String? error,
    T? body,
  }) {
    return ResDto<T>(
      resultType: resultType ?? this.resultType,
      errorCode: errorCode ?? this.errorCode,
      error: error ?? this.error,
      body: body ?? this.body,
    );
  }
}
