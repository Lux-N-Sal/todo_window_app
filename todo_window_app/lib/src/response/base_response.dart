// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class BaseResponse<T> {
  final String resultType;
  final String errorId;
  final String error;
  final T body;

  BaseResponse({
    required this.resultType,
    required this.errorId,
    required this.error,
    required this.body,
  });
}
