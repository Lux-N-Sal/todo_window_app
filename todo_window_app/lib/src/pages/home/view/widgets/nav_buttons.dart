// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/pages/home/provider/nav_viewmodel_provider.dart';
import 'package:todo_window_app/src/pages/home/view/widgets/todo_list_nav_tile.dart';
import 'package:todo_window_app/style/resources/palette.dart';

class NavButtons extends ConsumerWidget {
  const NavButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
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
              const HomePageTile(),
              const UserPageTile(),
              const SettingPageTile(),
              Divider(
                indent: 20,
                endIndent: 20,
                color: ref.theme.color.primary,
                thickness: 3,
              ),
              const TodoListNavTiles(),
            ],
          ),
        ),
      ),
    );
  }
}

/// 세팅 페이지 타일
class SettingPageTile extends ConsumerWidget {
  const SettingPageTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavTile(
      icon: Icons.settings,
      index: -1,
      onTap: () {
        ref.read(navViewmodelProvider.notifier).selectedIndex(-1);
      },
    );
  }
}

/// 사용자 페이지 타일
class UserPageTile extends ConsumerWidget {
  const UserPageTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavTile(
      icon: Icons.account_circle,
      index: -2,
      onTap: () {
        ref.read(navViewmodelProvider.notifier).selectedIndex(-2);
      },
    );
  }
}

/// 홈 페이지 타일
class HomePageTile extends ConsumerWidget {
  const HomePageTile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavTile(
      icon: Icons.home,
      index: -3,
      onTap: () {
        ref.read(navViewmodelProvider.notifier).selectedIndex(-3);
      },
    );
  }
}

/// Nav tile(home, user, setting)
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
