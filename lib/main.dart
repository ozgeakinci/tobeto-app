import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tobeto_app/widget/login_page.dart';

final theme = ThemeData(
    useMaterial3: true,
    appBarTheme:
        const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: const Color(0xFF9833FF),
        background: const Color(0xFFFFFFFF),
        outline: const Color(0xFFC0C0C0),
        primary: const Color(0xFF9833FF),
        secondary: const Color(0xFF515151),
        onError: const Color(0xFFFE4657),
        onPrimary: const Color(0xFFFFFFFF),
        inversePrimary: const Color(0xFF00D29B)));

void main() {
  runApp(
    MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    ),
  );
}
