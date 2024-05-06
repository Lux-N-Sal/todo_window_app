import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_window_app/style/resources/font.dart';
import 'package:todo_window_app/style/theme/dart_theme.dart';
import 'package:todo_window_app/style/theme/light_theme.dart';

part 'app_color.dart';
part 'app_font.dart';
part 'app_mode.dart';

abstract class AppTheme {
  late final AppMode mode;
  late final AppColor color;
  late final AppFont font;
}
