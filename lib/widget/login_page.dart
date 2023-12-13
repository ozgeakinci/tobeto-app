import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/login_page_background.png'))),
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
                SizedBox(
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Kullanıcı Adı',
                          hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.outline),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.outline),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          prefixIcon: const Icon(Icons.person_2_rounded),
                          prefixIconColor:
                              Theme.of(context).colorScheme.outline),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Şifre',
                        hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.outline),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.outline),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        prefixIcon: const Icon(Icons.lock),
                        prefixIconColor: Theme.of(context).colorScheme.outline,
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
                          style:
                              TextStyle(color: Color.fromARGB(255, 80, 79, 79)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      fixedSize: const Size(350, 45)),
                  child: Text(
                    'Giriş',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.background,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Hala üye değil misiniz? Kayıt Ol',
                      style: TextStyle(color: Color(0xFF828282)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
