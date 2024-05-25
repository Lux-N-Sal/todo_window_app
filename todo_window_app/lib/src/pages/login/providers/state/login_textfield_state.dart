// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/pages/login/providers/login_provider.dart';

class LoginTextfieldState {
  final TextEditingController idController;
  final TextEditingController passwordController;
  LoginTextfieldState({
    required this.idController,
    required this.passwordController,
  });

  factory LoginTextfieldState.init() => LoginTextfieldState(
        idController: TextEditingController(),
        passwordController: TextEditingController(),
      );

  void checkNotEmpty(WidgetRef ref) {
    final isNotEmpty =
        idController.text.isNotEmpty && passwordController.text.isNotEmpty;

    ref.read(loginViewmodelProvider.notifier).onChange(isNotEmpty);
  }

  LoginTextfieldState copyWith({
    TextEditingController? idController,
    TextEditingController? passwordController,
  }) {
    return LoginTextfieldState(
      idController: idController ?? this.idController,
      passwordController: passwordController ?? this.passwordController,
    );
  }
}
