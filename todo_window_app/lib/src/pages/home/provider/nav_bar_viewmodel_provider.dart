import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_window_app/src/pages/home/provider/state/nav_bar_state.dart';

part 'nav_bar_viewmodel_provider.g.dart';

@riverpod
class NavBarViewmodel extends _$NavBarViewmodel {
  @override
  NavBarState build() {
    return NavBarState.init();
  }

  void setIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  void changeExpandState() {
    state = state.copyWith(isExpanded: !state.isExpanded);
  }

  void toggleExpand(AnimationController controller) {
    if (state.isExpanded) {
      controller.reverse();
    } else {
      controller.forward();
    }
    changeExpandState();
  }
}

@riverpod
AnimationController animationController(
  AnimationControllerRef ref,
  TickerProvider ticker,
) {
  final controller = AnimationController(
    duration: const Duration(milliseconds: 50),
    vsync: ticker,
  );
  return controller;
}

@Riverpod(dependencies: [])
TickerProvider tickerProvider(TickerProviderRef ref) {
  throw UnimplementedError;
}
