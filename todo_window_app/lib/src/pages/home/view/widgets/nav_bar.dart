// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/enum/api.dart';
import 'package:todo_window_app/src/pages/home/provider/create_todo_list_provider.dart';
import 'package:todo_window_app/src/pages/home/provider/nav_viewmodel_provider.dart';
import 'package:todo_window_app/src/pages/home/provider/session_provider.dart';
import 'package:todo_window_app/src/pages/home/provider/todo_list_provider.dart';
import 'package:todo_window_app/src/repositories/provider/todo_list_repository_provider.dart';
import 'package:todo_window_app/style/component/button/outlined_icon_button.dart';
import 'package:todo_window_app/style/component/custom_border_textfield.dart';
import 'package:todo_window_app/style/resources/button_size.dart';
import 'package:todo_window_app/style/resources/palette.dart';

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

class CreateTodoListTextfield extends ConsumerWidget {
  const CreateTodoListTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(createTodoListControllerProvider);
    final jwt = ref.watch(sessionProvider).jwt;
    return Container(
      decoration: BoxDecoration(
        color: ref.theme.color.background,
      ),
      child: Row(
        children: [
          CustomBorderTextField(
            width: 200,
            preIcon: Icons.add,
            title: "새 목록",
            controller: controller,
            onSubmitted: (text) async {
              final res = await ref
                  .read(todoListRepositoryProvider)
                  .createTodoList(jwt: jwt, listName: text);
              if (res.resultType == APIResult.s.getString()) {
                ref.read(todoListProvider.notifier).add(res.body);
              }
            },
          ),
          Expanded(
            child: OutlinedIconButton(
              height: ButtonSize.small40,
              icon: Icons.add,
              iconSize: 30,
              onPressed: () async {
                final res = await ref
                    .read(todoListRepositoryProvider)
                    .createTodoList(jwt: jwt, listName: controller.text);
                if (res.resultType == APIResult.s.getString()) {
                  ref.read(todoListProvider.notifier).add(res.body);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

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

class TodoListNavTiles extends ConsumerWidget {
  const TodoListNavTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);
    return Expanded(
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return TodoListTile(
            index: index,
            onTap: () {
              /// 선택한 인덱스 적용
              ref.read(navViewmodelProvider.notifier).selectedIndex(index);
            },
            title: todos[index].name,
          );
        },
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

/// 토스트 리스트들 타일
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
          trailing: OutlinedIconButton(
            icon: Icons.edit,
            onPressed: () {},
          ),
          onTap: onTap,
        ),
      ),
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
