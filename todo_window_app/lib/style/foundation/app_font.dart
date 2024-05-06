part of 'app_theme.dart';

class AppFont {
  AppFont({
    required this.font,
    required this.fontColor,
    required this.hintColor,
  });

  final Font font;
  final Color fontColor;
  final Color hintColor;

  late FontWeight light = font.light;
  late FontWeight regular = font.regular;
  late FontWeight semiBold = font.semiBold;

  /// headline
  late final TextStyle headline1 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: font.semiBold,
    fontSize: 28,
    color: fontColor,
  );
  late final TextStyle headline2 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: font.semiBold,
    fontSize: 24,
    color: fontColor,
  );
  late final TextStyle headline3 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: font.semiBold,
    fontSize: 21,
    color: fontColor,
  );
  late final TextStyle headline4 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: font.semiBold,
    fontSize: 19,
    color: fontColor,
  );
  late final TextStyle headline5 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: font.semiBold,
    fontSize: 17,
    color: fontColor,
  );
  late final TextStyle headline6 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: font.semiBold,
    fontSize: 15,
    color: fontColor,
  );

  // subtitle
  late final TextStyle subtitle1 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: font.regular,
    fontSize: 14,
    color: fontColor,
  );
  late final TextStyle subtitle2 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: font.regular,
    fontSize: 12,
    color: fontColor,
  );

  /// body
  late final TextStyle body1 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: font.regular,
    fontSize: 14,
    color: fontColor,
  );

  late final TextStyle w500body1 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: fontColor,
  );

  late final TextStyle boldbody1 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: fontColor,
  );

  late final TextStyle boldbody15 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: FontWeight.bold,
    fontSize: 13,
    color: fontColor,
  );

  late final TextStyle body15 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: font.regular,
    fontSize: 13,
    color: fontColor,
  );

  late final TextStyle body2 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: font.regular,
    fontSize: 12,
    color: fontColor,
  );

  late final TextStyle w500body2 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: fontColor,
  );

  late final TextStyle boldbody2 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: FontWeight.bold,
    fontSize: 12,
    color: fontColor,
  );

  late final TextStyle body25 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: font.regular,
    fontSize: 11,
    color: fontColor,
  );

  late final TextStyle w500body25 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: FontWeight.w500,
    fontSize: 11,
    color: fontColor,
  );

  late final TextStyle boldbody25 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: FontWeight.bold,
    fontSize: 11,
    color: fontColor,
  );

  late final TextStyle body3 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: font.regular,
    fontSize: 10,
    color: fontColor,
  );

  late final TextStyle boldbody3 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: FontWeight.bold,
    fontSize: 10,
    color: fontColor,
  );

  late final TextStyle boldbody4 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: FontWeight.bold,
    fontSize: 11,
    color: fontColor,
  );

  late final TextStyle hintBody13 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: font.regular,
    fontSize: 13,
    color: hintColor,
  );
  late final TextStyle hintBody12 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: font.regular,
    fontSize: 12,
    color: hintColor,
  );
  late final TextStyle hintBody10 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: font.regular,
    fontSize: 10,
    color: hintColor,
  );
  late final TextStyle boldhintBody10 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: FontWeight.bold,
    fontSize: 10,
    color: hintColor,
  );
  late final TextStyle boldhintBody12 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: FontWeight.bold,
    fontSize: 12,
    color: hintColor,
  );
  late final TextStyle boldhintBody13 = TextStyle(
    height: 1.3,
    fontFamily: font.name,
    fontWeight: FontWeight.bold,
    fontSize: 13,
    color: hintColor,
  );
}
