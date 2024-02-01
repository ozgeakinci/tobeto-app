import 'package:flutter/material.dart';
import 'package:tobeto_app/language/language_items.dart';
import 'package:tobeto_app/view/screens/login_page.dart';
import 'package:tobeto_app/view/screens/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLogin = true;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Widget formWidget = _isLogin ? const LoginPage() : const RegisterPage();
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/login_page_background.png'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isDarkMode
                ? Image.asset('assets/images/tobeto_logo_dark.png')
                : Image.asset('assets/images/tobeto_logo_light.png'),
            Center(
              child: formWidget,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
            )
          ],
        ),
      ),
    ));
  }
}
