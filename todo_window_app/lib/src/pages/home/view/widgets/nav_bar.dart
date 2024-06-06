// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/pages/home/view/widgets/create_todo_list_textfield.dart';
import 'package:todo_window_app/src/pages/home/view/widgets/nav_buttons.dart';

class NavBar extends ConsumerWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        children: [
          Container(
            color: ref.theme.color.background,
            height: 30,
            child: MoveWindow(),
          ),
          const NavButtons(),
          const CreateTodoListTextfield(),
          Container(
            height: 100,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
