// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TodoListState {
  final String id;
  final String name;
  final TextEditingController controller;
  final FocusNode focusNode;

  TodoListState({
    required this.id,
    required this.name,
    required this.controller,
    required this.focusNode,
  });

  factory TodoListState.init() => TodoListState(
      id: "",
      name: "",
      controller: TextEditingController(),
      focusNode: FocusNode());

  factory TodoListState.fromJson(Map<String, dynamic> json) => TodoListState(
      id: json["listId"] ?? "",
      name: json["listName"] ?? "",
      controller: TextEditingController(),
      focusNode: FocusNode());

  TodoListState copyWith({
    String? id,
    String? name,
    TextEditingController? controller,
    FocusNode? focusNode,
  }) {
    return TodoListState(
      id: id ?? this.id,
      name: name ?? this.name,
      controller: controller ?? this.controller,
      focusNode: focusNode ?? this.focusNode,
    );
  }
}
