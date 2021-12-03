import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({
    Key? key,
    required this.title,
    this.center = true,
    this.fontSize = 24.0,
  }) : super(key: key);

  final String title;
  final bool center;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        color: const Color(0xff1B2559),
        fontWeight: FontWeight.w600,
      ),
    );

    return center ? Center(child: textWidget) : textWidget;
  }
}
