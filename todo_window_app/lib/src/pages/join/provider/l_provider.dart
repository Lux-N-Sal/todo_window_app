import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'l_provider.g.dart';

@riverpod
class L extends _$L {
  @override
  bool build() {
    return false;
  }

  void lt() {
    state = true;
    print("loading ture");
  }

  void lf() {
    state = false;
    print("loading false");
  }
}
