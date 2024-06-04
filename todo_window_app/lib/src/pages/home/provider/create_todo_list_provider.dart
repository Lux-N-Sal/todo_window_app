import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_todo_list_provider.g.dart';

@Riverpod(dependencies: [])
TextEditingController createTodoListController(
    CreateTodoListControllerRef ref) {
  return TextEditingController();
}
