// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/pages/join/provider/join_provider.dart';

class JoinTextfieldState {
  final TextEditingController idController;
  final TextEditingController passwordController;
  final TextEditingController passwordCheckController;
  final TextEditingController nameController;
  final TextEditingController emailController;
  JoinTextfieldState({
    required this.idController,
    required this.passwordController,
    required this.passwordCheckController,
    required this.nameController,
    required this.emailController,
  });

  factory JoinTextfieldState.init() => JoinTextfieldState(
        idController: TextEditingController(),
        passwordController: TextEditingController(),
        passwordCheckController: TextEditingController(),
        nameController: TextEditingController(),
        emailController: TextEditingController(),
      );

  void checkNotEmpty(WidgetRef ref) {
    final isNotEmpty = idController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        passwordCheckController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty;

    ref.read(joinViewmodelProvider.notifier).onChange(isNotEmpty);
  }

  JoinTextfieldState copyWith({
    TextEditingController? idController,
    TextEditingController? passwordController,
    TextEditingController? passwordCheckController,
    TextEditingController? nameController,
    TextEditingController? emailController,
  }) {
    return JoinTextfieldState(
      idController: idController ?? this.idController,
      passwordController: passwordController ?? this.passwordController,
      passwordCheckController:
          passwordCheckController ?? this.passwordCheckController,
      nameController: nameController ?? this.nameController,
      emailController: emailController ?? this.emailController,
    );
  }
}
