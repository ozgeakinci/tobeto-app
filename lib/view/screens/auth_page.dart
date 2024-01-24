import 'package:flutter/material.dart';
import 'package:tobeto_app/language/language_items.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/screens/login_page.dart';
import 'package:tobeto_app/view/screens/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLogin = false;
  @override
  Widget build(BuildContext context) {
    Widget formWidget = _isLogin ? const LoginPage() : const RegisterPage();
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: Stack(children: [
            formWidget,
            Positioned(
              bottom: 30,
              left: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_isLogin
                      ? LanguageItems.isNotMember
                      : LanguageItems.isMember),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(
                      _isLogin
                          ? LanguageItems.registerText
                          : LanguageItems.loginText,
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
