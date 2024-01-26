import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_event.dart';
import 'package:tobeto_app/language/language_items.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _email = '';
    String _password = '';

    void _submit() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        context.read<AuthBloc>().add(Login(email: _email, password: _password));
      }
    }

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
                        onSaved: (value) => _email = value!,
                        hintText: LanguageItems.hintEmailText,
                        prefixIcon: Icons.person_2_rounded),
                    SizedBox(
                      height: ProjectUtilities.projectHeight_8,
                    ),
                    CustomTextField(
                      onSaved: (value) => _password = value!,
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
                        _submit();
                      },
                      child: const Text(LanguageItems.loginIn),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //       top: ProjectUtilities.projectHeight_32),
                    //   child: Center(
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         const Text(
                    //           LanguageItems.isMember,
                    //         ),
                    //         TextButton(
                    //           onPressed: () {},
                    //           child: const Text(
                    //             LanguageItems.registerText,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // )
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
