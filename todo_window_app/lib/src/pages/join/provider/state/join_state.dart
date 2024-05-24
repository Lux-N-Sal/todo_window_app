// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:todo_window_app/src/pages/join/provider/state/join_textfield_state.dart';

class JoinState {
  final bool isLoading;
  final bool isNotEmpty;
  final JoinTextfieldState joinTextfieldState;

  JoinState({
    required this.isLoading,
    required this.isNotEmpty,
    required this.joinTextfieldState,
  });

  factory JoinState.init() => JoinState(
        isLoading: false,
        isNotEmpty: false,
        joinTextfieldState: JoinTextfieldState.init(),
      );

  JoinState copyWith({
    bool? isLoading,
    bool? isNotEmpty,
    JoinTextfieldState? joinTextfieldState,
  }) {
    return JoinState(
      isLoading: isLoading ?? this.isLoading,
      isNotEmpty: isNotEmpty ?? this.isNotEmpty,
      joinTextfieldState: joinTextfieldState ?? this.joinTextfieldState,
    );
  }
}
