import 'package:digicoach/src/common/constants/constants.dart';
import 'package:flutter/material.dart';

/// Elevated button style
final ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    primary: kPrimaryColor, // background
    onPrimary: kWhiteColor, // foreground/text
    onSurface: kGreyColor, // disabled
    textStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: kDefaultFontSize,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    elevation: 0,
  ),
);

/// Outlined button style
final OutlinedButtonThemeData outlinedButtonThemeData = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    backgroundColor: kWhiteColor,
    primary: kBlackColor, // text
    onSurface: kGreyColor, // disabled
    side: const BorderSide(color: kPrimaryColor),
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: kDefaultFontSize,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40.0),
    ),
    elevation: 0,
  ),
);

///input decorator
const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  contentPadding: EdgeInsets.fromLTRB(kDefaultPadding, 0, kDefaultPadding, 0),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
    borderRadius: BorderRadius.all(Radius.circular(40)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
    borderRadius: BorderRadius.all(Radius.circular(40)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
    borderRadius: BorderRadius.all(Radius.circular(40)),
  ),
  hintStyle: TextStyle(
    color: kBlackColor,
    fontSize: kDefaultFontSize,
  ),
  labelStyle: TextStyle(
    color: kBlackColor,
    fontSize: kDefaultFontSize,
  ),
);
