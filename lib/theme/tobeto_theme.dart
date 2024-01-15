import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';

class TobetoAppTheme {
  //Light Theme
  static ThemeData lightTheme() {
    return ThemeData(
        useMaterial3: true,
        colorScheme: TobetoAppColor.colorSchemeLight,
        scaffoldBackgroundColor: TobetoAppColor.backgroundLight,
        //Appbar Control

        appBarTheme: AppBarTheme(
            systemOverlayStyle: ThemeData.dark().appBarTheme.systemOverlayStyle,
            color: TobetoAppColor.colorSchemeLight.primary,
            titleTextStyle:
                TextStyle(color: TobetoAppColor.textColorDark, fontSize: 20)),

        // showModalBottomSheet => Üst köşelerin düz olması saglandı
        bottomSheetTheme: const BottomSheetThemeData(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
        //Text Control
        textTheme: TextTheme(
          // size = 16
          bodyLarge: TextStyle(
            color: TobetoAppColor.backgroundDark,
          ),
          // default text theme size = 14
          bodyMedium: TextStyle(
              color: TobetoAppColor.textColorBlack,
              fontWeight: FontWeight.w500),

          // size=12
          bodySmall: TextStyle(
            color: TobetoAppColor.textColorBlack,
          ),
          titleLarge: TextStyle(
              color: TobetoAppColor.textColorBlack,
              fontWeight: FontWeight.w600),
          labelLarge: TextStyle(
              color: TobetoAppColor.textColor, fontWeight: FontWeight.bold),
        ),

        //Input Control
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: TobetoAppColor.textColor,
          suffixIconColor: TobetoAppColor.textColor,
          labelStyle: TextStyle(
            color: TobetoAppColor.textColor,
          ),
        ),
        //Button Control
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: TobetoAppColor.colorSchemeLight.primary,
              fixedSize: const Size(350, 45),
              foregroundColor: TobetoAppColor.textColorDark),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: TobetoAppColor.textColorBlack,
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
              foregroundColor: TobetoAppColor.textColorDark, iconSize: 25),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              backgroundColor: TobetoAppColor.buttonColorLight,
              foregroundColor: TobetoAppColor.colorSchemeLight.primary,
              fixedSize: const Size(140, 60)),
        ),
        iconTheme:
            IconThemeData(color: TobetoAppColor.buttonColorDark, size: 30),

        //Drawer Control

        drawerTheme:
            DrawerThemeData(backgroundColor: TobetoAppColor.backgroundLight));
  }

  //Dark Theme
  static ThemeData darkTheme() {
    return ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: TobetoAppColor.backgroundDark,
        appBarTheme: AppBarTheme(
            color: TobetoAppColor.backgroundDark,
            systemOverlayStyle:
                ThemeData.light().appBarTheme.systemOverlayStyle,
            titleTextStyle:
                TextStyle(color: TobetoAppColor.textColorDark, fontSize: 20)),
        colorScheme: TobetoAppColor.colorSchemeDark,
        // showModalBottomSheet => Üst köşelerin düz olması saglandı
        bottomSheetTheme: const BottomSheetThemeData(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: TobetoAppColor.textColorDark,
          ),
          bodyMedium: TextStyle(
              color: TobetoAppColor.textColorDark, fontWeight: FontWeight.w500),
          bodySmall: TextStyle(color: TobetoAppColor.textColorDark),
          titleLarge: TextStyle(
              color: TobetoAppColor.textColorDark, fontWeight: FontWeight.w600),
          labelLarge: TextStyle(
              color: TobetoAppColor.textColor, fontWeight: FontWeight.bold),
          displayLarge: TextStyle(color: TobetoAppColor.textColorBlack),
        ),

        //Input Control
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: TobetoAppColor.textColor,
          suffixIconColor: TobetoAppColor.textColor,
          labelStyle: TextStyle(
            color: TobetoAppColor.textColor,
          ),
        ),

        //Button Control

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: TobetoAppColor.colorSchemeLight.primary,
              fixedSize: const Size(350, 45),
              foregroundColor: TobetoAppColor.textColorDark),
        ),
        textButtonTheme: TextButtonThemeData(
          style:
              TextButton.styleFrom(foregroundColor: TobetoAppColor.textColor),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
              foregroundColor: TobetoAppColor.textColorDark, iconSize: 25),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: TobetoAppColor.buttonColorLight,
            foregroundColor: TobetoAppColor.colorSchemeLight.primary,
            fixedSize: const Size(140, 60),
          ),
        ),
        iconTheme:
            IconThemeData(color: TobetoAppColor.buttonColorDark, size: 30),
        drawerTheme:
            DrawerThemeData(backgroundColor: TobetoAppColor.backgroundDark));
  }
}
