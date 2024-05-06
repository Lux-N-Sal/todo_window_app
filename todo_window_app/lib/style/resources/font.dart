import 'package:flutter/material.dart';

abstract class Font {
  Font({
    required this.name,
    required this.light,
    required this.regular,
    required this.semiBold,
  });

  final String name;
  final FontWeight light;
  final FontWeight regular;
  final FontWeight semiBold;
}

class NotoSans implements Font {
  const NotoSans();

  @override
  final String name = 'noto_sans';

  @override
  final FontWeight light = FontWeight.w300;

  @override
  final FontWeight regular = FontWeight.w400;

  @override
  final FontWeight semiBold = FontWeight.w600;
}
