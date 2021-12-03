import 'package:digicoach/src/common/constants/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

TextSpan customTextSpan({
  required String text,
  double fontSize = 12.0,
  double letterSpacing = 1.1,
  Color color = kPrimaryColor,
  double wordSpacing = 1.4,
  FontWeight fontWeight = FontWeight.normal,
  required GestureRecognizer onTap,
  // Single tapp
  bool underLine = false,
  final double? height,
}) {
  return TextSpan(
    text: text,
    style: TextStyle(
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      color: color,
      height: height ?? 1.2,
      fontWeight: fontWeight,
      wordSpacing: wordSpacing,
      decoration: underLine ? TextDecoration.underline : TextDecoration.none,
    ),
    recognizer: onTap,
  );
}
