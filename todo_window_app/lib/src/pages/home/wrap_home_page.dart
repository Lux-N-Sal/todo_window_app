import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/src/pages/home/home_page.dart';
import 'package:todo_window_app/src/pages/home/provider/nav_bar_viewmodel_provider.dart';

class WrapHomePage extends StatefulWidget {
  const WrapHomePage({super.key});

  @override
  State<WrapHomePage> createState() => _WrapHomePageState();
}

class _WrapHomePageState extends State<WrapHomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        tickerProviderProvider.overrideWithValue(this),
      ],
      child: const HomePage(),
    );
  }
}
