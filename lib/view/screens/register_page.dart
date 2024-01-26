import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_event.dart';
import 'package:tobeto_app/language/language_items.dart';
import 'package:tobeto_app/utilities/utilities.dart';
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
    String _username = '';

    void _submit() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        context.read<AuthBloc>().add(
            Register(email: _email, password: _password, username: _username));
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
                        onSaved: (value) => _username = value!,
                        hintText: LanguageItems.hintNameText,
                        prefixIcon: Icons.person_2_rounded),
                    SizedBox(
                      height: ProjectUtilities.projectHeight_8,
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
                    SizedBox(
                      height: ProjectUtilities.paddingAll_16,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {
                        _submit();
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
