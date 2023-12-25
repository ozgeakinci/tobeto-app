import 'package:flutter/material.dart';
import 'package:tobeto_app/view/swiper_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    const String _hintText = 'Kullanıcı Adı';
    const String _hintTextPassword = 'Şifre';
    const String _loginIn = 'Giriş';
    const String _isMember = 'Hala üye değil misiniz?';
    const String _registerText = 'Kayıt ol';

    return Scaffold(
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/images/login_page_background.png'))),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/images/tobeto-logo.png'),
                        const SizedBox(
                          height: 30,
                        ),
                        const SizedBox(
                          width: 350,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: _hintText,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                prefixIcon: Icon(Icons.person_2_rounded),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const SizedBox(
                          width: 350,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: _hintTextPassword,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Şifremi Unuttum',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => const SwiperPage()));
                          },
                          child: const Text(_loginIn),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(_isMember,
                                    style: TextStyle(fontSize: 16)),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    _registerText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
