import 'package:flutter/material.dart';

class GradientShaderText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;
  final double fontSize;
  const GradientShaderText({
    Key? key,
    this.fontSize = 34,
    required this.text,
    this.fontWeight = FontWeight.w600,
    this.textAlign = TextAlign.center,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (rect) => LinearGradient(
        colors: <Color>[
          const Color(0xff2F00FF).withOpacity(0.8),
          const Color(0xff2F00FF),
          const Color(0xff10A9F3),
        ],
        stops: const [0.15, 0.35, 0.7],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ).createShader(rect),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}
