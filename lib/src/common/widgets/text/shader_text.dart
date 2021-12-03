import 'package:digicoach/src/common/constants/constants.dart';
import 'package:flutter/material.dart';

class ShaderText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;
  final double? fontSize;
  const ShaderText({
    Key? key,
    this.fontSize,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? kDefaultFontSize,
        fontWeight: fontWeight,
        foreground: Paint()
          ..shader = const LinearGradient(
            colors: <Color>[
              Color(0xff0052D4),
              Color(0xff65C7F7),
              Color(0xff9CECFB)
            ],
          ).createShader(
            text.length > 20
                ? const Rect.fromLTWH(20.0, 0.0, 200.0, 10.0)
                : const Rect.fromLTWH(120.0, 0.0, 200.0, 10.0),
          ),
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
