import 'package:flutter/material.dart';
import 'package:tobeto_app/language/language_items.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/swiper_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image:
                        AssetImage('assets/images/login_page_background.png'))),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    padding: EdgeInsets.all(ProjectUtilities.paddingAll_24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/images/tobeto-logo.png'),
                        SizedBox(
                          height: ProjectUtilities.projectHeight_32,
                        ),
                        const CustomTextField(
                            hintText: LanguageItems.hintText,
                            prefixIcon: Icons.person_2_rounded),
                        SizedBox(
                          height: ProjectUtilities.projectHeight_8,
                        ),
                        const CustomTextField(
                          hintText: LanguageItems.hintTextPassword,
                          prefixIcon: Icons.lock,
                          obscureText: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  right: ProjectUtilities.sizeWidth_8),
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  LanguageItems.forgotPassword,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ProjectUtilities.paddingAll_8,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => const SwiperPage()));
                          },
                          child: const Text(LanguageItems.loginIn),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: ProjectUtilities.projectHeight_32),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  LanguageItems.isMember,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    LanguageItems.registerText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            prefixIcon: Icon(prefixIcon),
          ),
        ),
      ),
    );
  }
}
