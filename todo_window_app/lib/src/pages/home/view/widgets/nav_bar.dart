// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/pages/home/provider/nav_viewmodel_provider.dart';
import 'package:todo_window_app/style/resources/palette.dart';

class NavBar extends ConsumerWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Container(
            color: ref.theme.color.background,
            height: 30,
            child: MoveWindow(),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: ref.theme.color.background,
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NavTile(
                      icon: Icons.home,
                      index: 0,
                      onTap: () {
                        ref
                            .read(navViewmodelProvider.notifier)
                            .selectedIndex(0);
                      },
                    ),
                    NavTile(
                      icon: Icons.account_circle,
                      index: 1,
                      onTap: () {
                        ref
                            .read(navViewmodelProvider.notifier)
                            .selectedIndex(1);
                      },
                    ),
                    NavTile(
                      icon: Icons.settings,
                      index: 2,
                      onTap: () {
                        ref
                            .read(navViewmodelProvider.notifier)
                            .selectedIndex(2);
                      },
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
