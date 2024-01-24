import 'package:flutter/material.dart';
import 'package:tobeto_app/language/language_items.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/swiper_page.dart';
import 'package:tobeto_app/view/widgets/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _email = '';
    String _password = '';
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image:
                      AssetImage('assets/images/login_page_background.png'))),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/tobeto-logo.png'),
                    SizedBox(
                      height: ProjectUtilities.projectHeight_32,
                    ),
                    CustomTextField(
                        onSaved: _email,
                        hintText: LanguageItems.hintNameText,
                        prefixIcon: Icons.person_2_rounded),
                    SizedBox(
                      height: ProjectUtilities.projectHeight_8,
                    ),
                    CustomTextField(
                        onSaved: _password,
                        hintText: LanguageItems.hintEmailText,
                        prefixIcon: Icons.person_2_rounded),
                    SizedBox(
                      height: ProjectUtilities.projectHeight_8,
                    ),
                    CustomTextField(
                      onSaved: _password,
                      hintText: LanguageItems.hintTextPassword,
                      prefixIcon: Icons.lock,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: ProjectUtilities.paddingAll_16,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const SwiperPage()));
                      },
                      child: const Text(LanguageItems.registerText),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
