import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/util/lang/provider/model/lang_state.dart';

part 'lang_provider.g.dart';

@riverpod
class Lang extends _$Lang {
  @override
  LanguageState build() {
    return LanguageState.init();
  }

  void toggleLanguage(String locale) {
    state = state.copyWith(localeName: LocaleName.toEnum(locale));
  }
}
