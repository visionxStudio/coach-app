import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.borderRadius,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
    this.width,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? fontColor;
  final double? borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width * 0.4,
        height: 55.0,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 32.0),
          color: backgroundColor ?? const Color(0xff259CD5),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize ?? 18.0,
              color: fontColor ?? Colors.white,
              fontWeight: fontWeight ?? FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
