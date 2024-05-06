import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_window_app/util/lang/generated/l10n.dart';

enum LocaleName {
  en,
  ko;

  Locale getLocale() {
    switch (this) {
      case LocaleName.en:
        return const Locale('en');
      case LocaleName.ko:
        return const Locale('ko');
    }
  }

  String getString() {
    switch (this) {
      case LocaleName.en:
        return "English";
      case LocaleName.ko:
        return "한국어";
    }
  }

  /// String을 enum LocaleName 으로 만들어주는 static 함수
  static LocaleName toEnum(String value) {
    try {
      return LocaleName.values.firstWhere(
        (element) => element.getString() == value,
        orElse: () => LocaleName.ko,
      );
    } catch (e, s) {
      log("${e.toString()}\n${s.toString()}");
      return LocaleName.ko;
    }
  }
}

class LocaleState {
  LocaleName localeName;

  static LocaleState? _instance;

  LocaleState._privateConstructor({
    required this.localeName,
  });

  static LocaleState getInstance({required LocaleName? localeName}) {
    _instance ??= LocaleState._privateConstructor(localeName: localeName!);
    return _instance!;
  }

  void updateLocale({required LocaleName newLocaleName}) {
    localeName = newLocaleName;
  }
}

class LanguageState {
  final LocaleName localeName;
  final S language;
  LanguageState({
    required this.localeName,
    required this.language,
  });

  factory LanguageState.init() {
    // final LocaleState localeState = LocaleState.getInstance(localeName: null);
    final LocaleState localeState =
        LocaleState.getInstance(localeName: LocaleName.en);
    return LanguageState(
      localeName: localeState.localeName,
      language: S(),
    );
  }

  LanguageState copyWith({
    LocaleName? localeName,
    S? language,
  }) {
    return LanguageState(
      localeName: localeName ?? this.localeName,
      language: language ?? this.language,
    );
  }
}
