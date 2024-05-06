import 'package:flutter/material.dart';

class CustomImageTile extends StatelessWidget {
  const CustomImageTile({
    Key? key,
    BoxFit? boxfit,
    EdgeInsetsGeometry? margin,
    required this.title,
    this.color,
  })  : boxfit = boxfit ?? BoxFit.scaleDown,
        margin = margin ?? const EdgeInsets.all(0),
        super(key: key);

  final String title;
  final BoxFit boxfit;
  final Color? color;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: color == null
          ? Image.asset(
              'assets/images/$title.png',
              fit: boxfit,
            )
          : Image.asset(
              'assets/images/$title.png',
              fit: boxfit,
              color: color,
              colorBlendMode: BlendMode.modulate,
            ),
    );
  }
}
