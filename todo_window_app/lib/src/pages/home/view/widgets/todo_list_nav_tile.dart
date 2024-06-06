// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/pages/home/provider/nav_viewmodel_provider.dart';
import 'package:todo_window_app/src/pages/home/provider/todo_list_provider.dart';
import 'package:todo_window_app/style/component/button/outlined_icon_button.dart';
import 'package:todo_window_app/style/resources/palette.dart';

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
              ref
                  .read(todoListProvider.notifier)
                  .setTitle(title: todos[index].name, index: index);
            },
            title: todos[index].name,
          );
        },
      ),
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
