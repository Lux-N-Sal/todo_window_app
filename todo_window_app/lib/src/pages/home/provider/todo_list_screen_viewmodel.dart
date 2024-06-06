import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/pages/home/provider/state/todo_list_screen_state.dart';

part 'todo_list_screen_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class TodoListScreenViewmodel extends _$TodoListScreenViewmodel {
  @override
  TodoListScreenState build() {
    ref.onDispose(
      () {
        print("TodoListScreenViewmodel.dispose");
      },
    );
    return TodoListScreenState.init();
  }

  void setEditing(bool value) {
    state = state.copyWith(isEditing: value);
    if (!value) {}
  }

  void setTitle(String title) {
    state.textEditingController.text = title;
  }
}
