import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';

class TobetoAppTheme {
  //Light Theme
  static ThemeData lightTheme() {
    return ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        colorScheme: TobetoAppColor.colorSchemeLight,
        // showModalBottomSheet => Üst köşelerin düz olması saglandı
        bottomSheetTheme: const BottomSheetThemeData(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
        //Text Control
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          // size = 16
          bodyLarge: GoogleFonts.poppins(
            color: TobetoAppColor.backgroundDark,
          ),
          // default text theme size = 14
          bodyMedium: GoogleFonts.poppins(
              color: TobetoAppColor.textColorBlack,
              fontWeight: FontWeight.normal),

          // size=12
          bodySmall: GoogleFonts.poppins(
            color: TobetoAppColor.textColorBlack,
          ),
          titleLarge: GoogleFonts.poppins(
            color: TobetoAppColor.textColorBlack,
          ),
          labelLarge: GoogleFonts.poppins(
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
              textStyle: const TextStyle()),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
              foregroundColor: TobetoAppColor.textColor, iconSize: 25),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
              backgroundColor: TobetoAppColor.buttonColorLight,
              foregroundColor: TobetoAppColor.colorSchemeLight.primary,
              fixedSize: const Size(140, 60)),
        ),
        iconTheme:
            IconThemeData(color: TobetoAppColor.buttonColorDark, size: 30));
  }

  //Dark Theme
  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: TobetoAppColor.backgroundDark,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      colorScheme: TobetoAppColor.colorSchemeDark,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        bodyLarge: GoogleFonts.poppins(
          color: TobetoAppColor.textColorDark,
        ),

        bodyMedium: GoogleFonts.poppins(
            color: TobetoAppColor.textColorDark, fontWeight: FontWeight.normal),
        bodySmall: GoogleFonts.poppins(color: TobetoAppColor.textColorDark),

        titleLarge: GoogleFonts.poppins(
          color: TobetoAppColor.textColorDark,
        ),

        labelLarge: GoogleFonts.poppins(
            color: TobetoAppColor.textColor, fontWeight: FontWeight.bold),
        displayLarge: TextStyle(color: TobetoAppColor.textColorBlack),

        // size = 16

        // size=12
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
            backgroundColor: TobetoAppColor.colorSchemeLight.primary,
            fixedSize: const Size(350, 45),
            foregroundColor: TobetoAppColor.textColorDark),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: TobetoAppColor.textColor),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
            foregroundColor: TobetoAppColor.textColor, iconSize: 30),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: TobetoAppColor.buttonColorLight,
          foregroundColor: TobetoAppColor.colorSchemeLight.primary,
          fixedSize: const Size(140, 60),
        ),
      ),
    );
  }
}
