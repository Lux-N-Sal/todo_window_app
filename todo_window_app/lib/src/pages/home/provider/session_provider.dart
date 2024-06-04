import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/pages/home/provider/state/session_state.dart';

part 'session_provider.g.dart';

@Riverpod(keepAlive: true)
class Session extends _$Session {
  @override
  SessionState build() {
    return SessionState.init();
  }

  void set(String jwt) {
    print(" jwt: $jwt");
    state = state.copyWith(jwt: jwt);
  }
}
