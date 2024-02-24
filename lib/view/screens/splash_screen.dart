import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tobeto_app/view/screens/start_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StartPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "TOBETOO",
        style: TextStyle(
          color: Colors.purple,
        ),
      )

          /* AnimatedTextKit(animatedTexts: [
          WavyAnimatedText("TOBETOO",
              textStyle: TextStyle(color: Color(0xFFFBCA2C), fontSize: 40))
        ]), */
          ),
    );
  }
}
