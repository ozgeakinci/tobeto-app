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
    primary: const Color(0xff822BD9),
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

  static Color textColorBlack = Color.fromARGB(255, 34, 34, 34);
  static Color textColorDark = Color(0xffC3C4CB);
  static Color textColor = Color.fromARGB(255, 123, 123, 123);
  static Color buttonColorDark = Color(0xff161618);
  static Color buttonColorLight = Colors.white;
  static Color backgroundDark = Color(0xff121319);
  static Color backgroundLight = const Color(0xfff5f5f5);
  static Color inputDarkBackground = const Color(0xff232531);
  static Color primaryBackgroundColor = Color.fromARGB(255, 105, 10, 200);
  static Color selecetedItemColor = Color.fromARGB(255, 157, 64, 250);
  static Color greyColor = Color(0xff8A9FA8);
  static Color greenColor = Color(0xff3D7731);
  static Color pinkColor = Color(0xffC75978);
  static Color yellowColor = Color(0xffE7C47D);
  static Color lightPinkColor = Color(0xffD68CB4);
  static Color darkYellowColor = Color(0xffAD906F);
  static Color orchisColor = Color(0xffCB8273);
}
