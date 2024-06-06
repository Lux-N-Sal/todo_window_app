// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class TodoListScreenState {
  final bool isEditing;
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  TodoListScreenState({
    required this.isEditing,
    required this.focusNode,
    required this.textEditingController,
  });

  factory TodoListScreenState.init() => TodoListScreenState(
        isEditing: false,
        focusNode: FocusNode(),
        textEditingController: TextEditingController(),
      );

  TodoListScreenState copyWith({
    bool? isEditing,
    FocusNode? focusNode,
    TextEditingController? textEditingController,
  }) {
    return TodoListScreenState(
      isEditing: isEditing ?? this.isEditing,
      focusNode: focusNode ?? this.focusNode,
      textEditingController:
          textEditingController ?? this.textEditingController,
    );
  }
}
