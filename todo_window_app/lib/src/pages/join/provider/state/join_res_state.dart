// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_window_app/src/response/join_response.dart';

class JoinResState {
  final bool isLoading;
  final JoinResponse joinResponse;
  JoinResState({
    required this.isLoading,
    required this.joinResponse,
  });

  factory JoinResState.init() =>
      JoinResState(isLoading: false, joinResponse: JoinResponse.init());

  JoinResState copyWith({
    bool? isLoading,
    JoinResponse? joinResponse,
  }) {
    return JoinResState(
      isLoading: isLoading ?? this.isLoading,
      joinResponse: joinResponse ?? this.joinResponse,
    );
  }
}
