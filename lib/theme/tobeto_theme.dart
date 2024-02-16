import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        color: TobetoAppColor.primaryBackgroundColor,
        elevation: 0,
        titleTextStyle:
            TextStyle(color: TobetoAppColor.textColorBlack, fontSize: 20),
        iconTheme: IconThemeData(color: TobetoAppColor.backgroundLight),
      ),

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
            color: TobetoAppColor.textColorBlack, fontWeight: FontWeight.w500),
        // size=12
        bodySmall: TextStyle(
          color: TobetoAppColor.textColorBlack,
        ),
        titleLarge: TextStyle(
            color: TobetoAppColor.textColorBlack, fontWeight: FontWeight.w600),
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
            fixedSize: const Size(360, 45),
            foregroundColor: TobetoAppColor.textColorDark,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
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
      iconTheme: IconThemeData(color: TobetoAppColor.buttonColorDark, size: 30),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          selectedItemColor: TobetoAppColor.primaryBackgroundColor,
          unselectedItemColor: TobetoAppColor.textColor),

      //Drawer Control

      drawerTheme:
          DrawerThemeData(backgroundColor: TobetoAppColor.backgroundLight),
    );
  }

  //Dark Theme
  static ThemeData darkTheme() {
    return ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: TobetoAppColor.backgroundDark,
        appBarTheme: AppBarTheme(
            color: TobetoAppColor.colorSchemeDark.primary,
            systemOverlayStyle:
                ThemeData.light().appBarTheme.systemOverlayStyle,
            elevation: 0,
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
              fixedSize: const Size(360, 45),
              foregroundColor: TobetoAppColor.textColorDark,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: TobetoAppColor.textColorDark),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
              foregroundColor: TobetoAppColor.textColorDark, iconSize: 25),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: TobetoAppColor.inputDarkBackground,
            foregroundColor: TobetoAppColor.textColorDark,
            fixedSize: const Size(140, 60),
          ),
        ),
        iconTheme:
            IconThemeData(color: TobetoAppColor.buttonColorDark, size: 30),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            elevation: 0,
            selectedItemColor: Color.fromARGB(255, 157, 64, 250),
            unselectedItemColor: TobetoAppColor.textColor),
        drawerTheme: DrawerThemeData(
          backgroundColor: TobetoAppColor.backgroundDark,
        ));
  }
}
