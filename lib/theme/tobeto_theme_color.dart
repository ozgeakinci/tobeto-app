import 'package:flutter/material.dart';

class TobetoAppColor {
  static ColorScheme colorSchemeLight = ColorScheme.fromSeed(
    seedColor: const Color(0xff822BD9),
    primary: const Color(0xff822BD9),
    secondary: const Color(0xFF00D29B),
    surface: const Color(0xFFFFFFFF),
    background: const Color(0xFFFFFFFF),
    onPrimary: const Color(0xFFFFFFFF),
    onSecondary: const Color(0xFF000000),
    onSurface: const Color(0xFF000000),
    onBackground: const Color(0xFF000000),
    error: const Color(0xFFFE4657),
    onError: const Color(0xFFFE4657),
    brightness: Brightness.light,
  );

  static ColorScheme colorSchemeDark = ColorScheme.fromSeed(
    seedColor: const Color(0xffB266FF),
    primary: const Color(0xffAA55FF),
    secondary: const Color(0xFF00D29B),
    surface: const Color(0xFF333333),
    background: const Color(0xFF333333),
    onPrimary: const Color(0xFFFFFFFF),
    onSecondary: const Color(0xFF000000),
    onSurface: const Color(0xFFFFFFFF),
    onBackground: const Color(0xFFFFFFFF),
    error: const Color(0xFFFE4657),
    onError: const Color(0xFFFE4657),
    brightness: Brightness.dark,
  );

  //Color shemada isimlendirmeye bakacağız

  static Color textColorBlack = const Color.fromARGB(255, 77, 77, 77);
  static Color textColorDark = const Color(0xFFFFFFFF);
  static Color textColor = const Color.fromARGB(255, 199, 198, 198);
  static Color buttonColorDark = Color(0xff161618);
  static Color buttonColorLight = Colors.white;
  static Color backgroundDark = Colors.black;
  static Color backgroundLight = const Color(0xfff5f5f5);
}
