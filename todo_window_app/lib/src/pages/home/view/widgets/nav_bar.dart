// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/pages/home/provider/nav_viewmodel_provider.dart';
import 'package:todo_window_app/src/pages/home/provider/todo_list_provider.dart';
import 'package:todo_window_app/style/resources/palette.dart';

class NavBar extends ConsumerWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        children: [
          Container(
            color: ref.theme.color.background,
            height: 30,
            child: MoveWindow(),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 80),
              width: double.infinity,
              height: double.infinity,
              color: ref.theme.color.background,
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    NavTile(
                      icon: Icons.home,
                      index: -3,
                      onTap: () {
                        ref
                            .read(navViewmodelProvider.notifier)
                            .selectedIndex(-3);
                      },
                    ),
                    NavTile(
                      icon: Icons.account_circle,
                      index: -2,
                      onTap: () {
                        ref
                            .read(navViewmodelProvider.notifier)
                            .selectedIndex(-2);
                      },
                    ),
                    NavTile(
                      icon: Icons.settings,
                      index: -1,
                      onTap: () {
                        ref
                            .read(navViewmodelProvider.notifier)
                            .selectedIndex(-1);
                      },
                    ),
                    Divider(
                      indent: 20,
                      endIndent: 20,
                      color: ref.theme.color.primary,
                      thickness: 3,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          return TodoListTile(
                            index: index,
                            onTap: () {
                              ref
                                  .read(navViewmodelProvider.notifier)
                                  .selectedIndex(index);
                            },
                            title: todos[index].name,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

class TodoListTile extends ConsumerWidget {
  const TodoListTile({
    super.key,
    required this.title,
    required this.index,
    this.onTap,
  });

  final String title;
  final int index;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navViewmodelProvider).selectedIndex;
    final isSelected = selectedIndex == index;

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? ref.theme.color.primary : Colors.transparent,
      ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          hoverColor:
              isSelected ? Palette.primaryHover : ref.theme.color.hoverColor,
          splashColor: Palette.primarySplash,
          title: Row(
            children: [
              Icon(
                Icons.today_outlined,
                color: isSelected
                    ? ref.theme.color.onPrimary
                    : ref.theme.color.text,
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: ref.theme.font.boldbody1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}

class NavTile extends ConsumerWidget {
  const NavTile({
    super.key,
    required this.icon,
    required this.index,
    this.onTap,
  });

  final IconData icon;
  final int index;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navViewmodelProvider).selectedIndex;
    final isSelected = selectedIndex == index;

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? ref.theme.color.primary : Colors.transparent,
      ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          hoverColor:
              isSelected ? Palette.primaryHover : ref.theme.color.hoverColor,
          splashColor: Palette.primarySplash,
          title: Icon(
            icon,
            color:
                isSelected ? ref.theme.color.onPrimary : ref.theme.color.text,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
