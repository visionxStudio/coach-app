import 'package:digicoach/src/common/constants/constants.dart';
import 'package:flutter/material.dart';

///light theme constants
const TextTheme lightTextTheme = TextTheme(
  headline1: _lightHeadline1,
  headline2: _lightHeadline2,
  headline3: _lightHeadline3,
  headline4: _lightHeadline4,
  headline5: _lightHeadline5,
  headline6: _lightHeadline6,
  bodyText1: _lightBodyText1,
  caption: _lightCaption,
  subtitle1: _lightSubtitle1,
  subtitle2: _lightSubtitle2,

  /// default style for Text() widget
  bodyText2: _lightBodyText2,
);

const _lightHeadline1 = TextStyle(
  color: kBlackColor,
  fontSize: kDefaultFontSize + 14,
  height: 1.5,
  fontWeight: FontWeight.bold,
  fontFamily: "Manrope",
);
const _lightHeadline2 = TextStyle(
  color: kBlackColor,
  fontSize: kDefaultFontSize + 12,
  height: 1.5,
  fontWeight: FontWeight.bold,
  fontFamily: "Manrope",
);
const _lightHeadline3 = TextStyle(
  color: kBlackColor,
  fontSize: kDefaultFontSize + 10,
  height: 1.3,
  fontWeight: FontWeight.w600,
  fontFamily: "Manrope",
);
const _lightHeadline4 = TextStyle(
  color: kBlackColor,
  fontSize: kDefaultFontSize + 8,
  height: 1.2,
  fontWeight: FontWeight.w600,
  fontFamily: "Manrope",
);
const _lightHeadline5 = TextStyle(
  color: kBlackColor,
  fontSize: kDefaultFontSize + 6,
  height: 1.2,
  fontWeight: FontWeight.w500,
  fontFamily: "Manrope",
);
const _lightHeadline6 = TextStyle(
  color: kBlackColor,
  fontSize: kDefaultFontSize + 4,
  fontWeight: FontWeight.w500,
  height: 1.2,
  fontFamily: "Manrope",
);
const _lightBodyText1 = TextStyle(
  color: kGreyColor,
  fontSize: kDefaultFontSize,
  fontWeight: FontWeight.w300,
  fontFamily: "Manrope",
);

/// default style for Text() widget
const _lightBodyText2 = TextStyle(
  color: kBlackColor,
  fontSize: kDefaultFontSize,
  fontWeight: FontWeight.w300,
  fontFamily: "Manrope",
);
const _lightSubtitle1 = TextStyle(
  color: kBlackColor,
  fontSize: kDefaultFontSize,
  fontWeight: FontWeight.w300,
  fontFamily: "Manrope",
);
const _lightSubtitle2 = TextStyle(
  color: kBlackColor,
  fontSize: kDefaultFontSize - 2,
  fontWeight: FontWeight.w300,
  fontFamily: "Manrope",
);
const _lightCaption = TextStyle(
  color: kGreyColor,
  fontSize: kDefaultFontSize - 4,
  fontWeight: FontWeight.w300,
  fontFamily: "Manrope",
);

/// Dark Theme constants
final TextTheme darkTextTheme = TextTheme(
  headline1: _darkHeadline1,
  headline2: _darkHeadline2,
  headline3: _darkHeadline3,
  headline4: _darkHeadline4,
  headline5: _darkHeadline5,
  headline6: _darkHeadline6,
  bodyText1: _darkBodyText1,
  bodyText2: _darkBodyText2,
  caption: _darkCaption,
  subtitle1: _darkSubtitle1,
  subtitle2: _darkSubtitle2,
);
final TextStyle _darkHeadline1 = _lightHeadline1.copyWith(color: kWhiteColor);
final TextStyle _darkHeadline2 = _lightHeadline2.copyWith(color: kWhiteColor);
final TextStyle _darkHeadline3 = _lightHeadline3.copyWith(color: kWhiteColor);
final TextStyle _darkHeadline4 = _lightHeadline4.copyWith(color: kWhiteColor);
final TextStyle _darkHeadline5 = _lightHeadline5.copyWith(color: kWhiteColor);
final TextStyle _darkHeadline6 = _lightHeadline6.copyWith(color: kWhiteColor);
final TextStyle _darkBodyText1 = _lightBodyText1.copyWith(color: kWhiteColor);
final TextStyle _darkBodyText2 = _lightBodyText2.copyWith(color: kWhiteColor);
final TextStyle _darkCaption = _lightCaption.copyWith(
  color: kWhiteColor.withOpacity(0.7),
);
final TextStyle _darkSubtitle1 = _lightSubtitle1.copyWith(color: kWhiteColor);
final TextStyle _darkSubtitle2 = _lightSubtitle2.copyWith(color: kWhiteColor);
