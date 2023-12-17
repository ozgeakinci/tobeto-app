import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme.dart';
import 'package:tobeto_app/widget/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      theme: TobetoAppTheme.lightTheme(),
      darkTheme: TobetoAppTheme.darkTheme(),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    ),
  );
}

//ozge değişiklik yaptı 