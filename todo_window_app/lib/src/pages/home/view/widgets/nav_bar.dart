// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/pages/home/provider/nav_bar_viewmodel_provider.dart';
import 'package:todo_window_app/style/component/button/custom_circle_button.dart';

class NavBar extends ConsumerWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticker = ref.watch(tickerProviderProvider);
    final controller = ref.watch(animationControllerProvider(ticker));

    final widthAnimation =
        Tween<double>(begin: 50, end: 200).animate(controller)
          ..addListener(() {
            print("a");
            controller.isCompleted;
          });
    return Column(
      children: [
        NavExpandButton(controller: controller),
        Expanded(
          child: Container(
            width: widthAnimation.value,
            color: ref.theme.color.background,
          ),
        ),
      ],
    );
  }
}

class NavExpandButton extends ConsumerWidget {
  const NavExpandButton({
    super.key,
    required this.controller,
  });

  final AnimationController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 50,
      height: 50,
      color: ref.theme.color.background,
      child: CustomCircleButton(
        icon: Icons.menu,
        onPressed: () {
          ref.read(navBarViewmodelProvider.notifier).toggleExpand(controller);
        },
        backgroundColor: ref.theme.color.background,
      ),
    );
  }
}
