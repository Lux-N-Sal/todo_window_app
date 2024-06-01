// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/pages/home/provider/nav_viewmodel_provider.dart';
import 'package:todo_window_app/src/pages/home/view/screen/todo_list_screen.dart';
import 'package:todo_window_app/src/pages/home/view/widgets/nav_bar.dart';
import 'package:todo_window_app/src/public/widgets/titlebar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navViewmodelProvider).selectedIndex;
    return Scaffold(
      body: Row(
        children: [
          const NavBar(),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: Column(
                children: [
                  const TitleBar(),
                  selectedIndex == -3
                      ? const TodoListScreen()
                      : selectedIndex == -2
                          ? const UserScreen()
                          : selectedIndex == -1
                              ? const SettingScreen()
                              : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingScreen extends StatelessWidget {
  const SettingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Colors.blue,
      ),
    );
  }
}

class UserScreen extends StatelessWidget {
  const UserScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: Colors.green,
      ),
    );
  }
}
