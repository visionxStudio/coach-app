import 'package:digicoach/src/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:digicoach/app_localization.dart';

class NormalText extends StatelessWidget {
  final double? fontSize;
  final bool isBold;
  final bool hasUnderline;
  final String text;
  final bool isCentered;
  final Color? color;
  final int? maxline;
  final double? letterspacing;
  final double? lineHight;
  final FontWeight? fontWeight;
  final bool isUpper;
  final double? minFontSize;
  const NormalText(
    this.text, {
    Key? key,
    this.isUpper = false,
    this.fontSize,
    this.minFontSize,
    this.fontWeight,
    this.lineHight,
    this.isBold = false,
    this.hasUnderline = false,
    this.isCentered = false,
    this.color,
    this.maxline,
    this.letterspacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return AutoSizeText(
    //   isUpper ? text.tr(context).toUpperCase() : text.tr(context),
    //   maxFontSize: fontSize ?? 18.0,
    //   // minFontSize: minFontSize ?? 16.0,
    //   style: Theme.of(context).textTheme.bodyText1!.copyWith(
    //       fontSize: fontSize ?? kDefaultFontSize,
    //       fontWeight:
    //           isBold ? FontWeight.bold : fontWeight ?? FontWeight.normal,
    //       decoration: hasUnderline ? TextDecoration.underline : null,
    //       color: color ?? kPrimaryColor,
    //       height: lineHight ?? 1.2,
    //       letterSpacing: letterspacing),
    //   textAlign: isCentered ? TextAlign.center : null,
    //   maxLines: maxline,
    //   overflow: maxline == null ? null : TextOverflow.ellipsis,
    // );
    return Text(
      isUpper ? text.tr(context).toUpperCase() : text.tr(context),
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: fontSize ?? kDefaultFontSize,
          fontWeight:
              isBold ? FontWeight.bold : fontWeight ?? FontWeight.normal,
          decoration: hasUnderline ? TextDecoration.underline : null,
          color: color ?? kPrimaryColor,
          height: lineHight ?? 1.2,
          letterSpacing: letterspacing),
      textAlign: isCentered ? TextAlign.center : null,
      maxLines: maxline,
      overflow: maxline == null ? null : TextOverflow.ellipsis,
    );
  }
}
