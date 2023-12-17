import 'package:flutter/material.dart';

class TobetoAppColor {
  static ColorScheme colorSchemeLight = ColorScheme.fromSeed(
    seedColor: const Color(0xFF9833FF),
    primary: const Color(0xFF9833FF),
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
    seedColor: const Color(0xFF9833FF),
    primary: const Color(0xFF9833FF),
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

  static Color textColor = const Color.fromARGB(255, 163, 163, 163);
  static Color textColorDark = const Color(0xFFFFFFFF);
  static Color backgroundDark = const Color(0xFF333333);
}
