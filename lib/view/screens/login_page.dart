import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_event.dart';
import 'package:tobeto_app/bloc/auth/auth_state.dart';
import 'package:tobeto_app/language/language_items.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/screens/forgot_password_page.dart';
import 'package:tobeto_app/view/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    final _formKey = GlobalKey<FormState>();
    String _email = '';
    String _password = '';

    void _submit() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        context.read<AuthBloc>().add(Login(email: _email, password: _password));
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: ProjectUtilities.projectHeight_24,
          ),
          CustomTextField(
            onSaved: (value) => _email = value!,
            labelText: LanguageItems.hintEmailText,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.mail,
            customValidator: (value) {
              if (value!.isEmpty ||
                  !RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
                      .hasMatch(value)) {
                return 'Geçerli bir email adresi giriniz';
              }
              return null;
            },
          ),
          CustomTextField(
            onSaved: (value) => _password = value!,
            labelText: LanguageItems.hintTextPassword,
            prefixIcon: Icons.lock,
            obscureText: true,
            maxLines: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(right: ProjectUtilities.projectHeight_24),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage()));
                  },
                  child: const Text(
                    LanguageItems.forgotPassword,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 0.84,
                    MediaQuery.of(context).size.height * 0.067)),
            onPressed: () {
              if (authBloc.errorMessages != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      authBloc.errorMessages!,
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }

              _submit();
            },
            child: const Text(LanguageItems.loginIn),
          ),
        ],
      ),
    );
  }
}
