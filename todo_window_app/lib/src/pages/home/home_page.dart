// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/pages/home/view/widgets/nav_bar.dart';
import 'package:todo_window_app/src/public/widgets/titlebar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: ref.theme.color.surface,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
