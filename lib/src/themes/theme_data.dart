import 'package:digicoach/src/common/constants/constants.dart';
import 'package:digicoach/src/themes/theme_widgets_constant.dart';
import 'package:flutter/material.dart';

import 'theme_constant.dart';

class Themes {
  Themes._(); // private constructor

  /// Light Theme
  static final ThemeData light = ThemeData.light().copyWith(
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: kPrimaryColor,
          secondary: kSecondaryColor,
          background: kSecondaryColor,
          brightness: Brightness.light,
        ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: lightTextTheme,
    scaffoldBackgroundColor: kWhiteColor,
    primaryIconTheme: const IconThemeData(color: kBlackColor),
    // elevatedButtonTheme: elevatedButtonThemeData,
    outlinedButtonTheme: outlinedButtonThemeData,
    inputDecorationTheme: inputDecorationTheme,
  );

  /// Dark Theme
  static final ThemeData dark = ThemeData.dark().copyWith(
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: kPrimaryColorDark,
            secondary: kSecondaryColor,
            background: kPrimaryColorDark,
            brightness: Brightness.dark,
          ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: darkTextTheme,
      scaffoldBackgroundColor: kBlackColor,
      primaryIconTheme: const IconThemeData(color: kWhiteColor),
      // elevatedButtonTheme: elevatedButtonThemeData,
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)));
}
