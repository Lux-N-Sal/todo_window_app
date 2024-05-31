import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/pages/home/provider/state/nav_bar_state.dart';

part 'nav_viewmodel_provider.g.dart';

@riverpod
class NavViewmodel extends _$NavViewmodel {
  @override
  NavBarState build() {
    return NavBarState.init();
  }

  void selectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }
}
