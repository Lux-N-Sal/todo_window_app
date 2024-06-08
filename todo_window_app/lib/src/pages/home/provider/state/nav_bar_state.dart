// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NavBarState {
  final int selectedIndex;
  final TextEditingController createTodoListController;
  NavBarState({
    required this.selectedIndex,
    required this.createTodoListController,
  });

  factory NavBarState.init() => NavBarState(
        selectedIndex: -3,
        createTodoListController: TextEditingController(),
      );

  NavBarState copyWith({
    int? selectedIndex,
    TextEditingController? createTodoListController,
  }) {
    return NavBarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      createTodoListController:
          createTodoListController ?? this.createTodoListController,
    );
  }
}
