import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_window_app/extensions/theme/themedata_ext.dart';
import 'package:todo_window_app/src/pages/join/view/join_page.dart';
import 'package:todo_window_app/src/pages/login/view/login_page.dart';
import 'package:todo_window_app/util/lang/generated/l10n.dart';
import 'package:todo_window_app/util/lang/provider/lang_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));

  appWindow.show();
  doWhenWindowReady(() {
    final win = appWindow;
    const initSize = Size(800, 600);
    win.minSize = initSize;
    win.size = initSize;
    win.alignment = Alignment.center;
    win.title = "Todo window app";

    win.show();
  });
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /// 타이틀
      title: 'Todo window app',

      /// 테마
      theme: ref.themeData,

      /// 다국어
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: ref.watch(langProvider).localeName.getLocale(),
      supportedLocales: S.delegate.supportedLocales,

      /// 홈페이지
      // home: const LoginPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/join': (context) => const JoinPage(),
      },
    );
  }
}
