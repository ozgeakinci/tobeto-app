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
    final _formKey = GlobalKey<FormState>();
    String _email = '';
    String _password = '';

    void _submit() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        context.read<AuthBloc>().add(Login(email: _email, password: _password));
      }
    }

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          print("NotAuthenticated İnitial");
        }
        if (state is NotAuthenticated) {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: ProjectUtilities.projectHeight_32,
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
                   customValidator: (value) {
                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Şifre en az bir büyük harf içermelidir';
  }

  // Şifre en az bir küçük harf içermelidir
  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Şifre en az bir küçük harf içermelidir';
  }

  // Şifre en az bir rakam içermelidir
  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Şifre en az bir rakam içermelidir';
  }

  // Şifre en az bir özel karakter içermelidir
  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    return 'Şifre en az bir özel karakter içermelidir';
  }

  // Şifre en az 8 karakterden oluşmalıdır
  if (value.length < 8) {
    return 'Şifre en az 8 karakterden oluşmalıdır';
  }
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: ProjectUtilities.projectHeight_24),
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
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.89,
                          MediaQuery.of(context).size.height * 0.064)),
                  onPressed: () {
                    if (state.errorMessage != null)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            state.errorMessage.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );

                    _submit();
                  },
                  child: const Text(LanguageItems.loginIn),
                ),
              ],
            ),
          );
        }
        if (state is Authenticated) {
          print("NotAuthenticated   Giriş hyapıltı ");
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 3,
                  child: const CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Giriş yapılıyor...",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Transform.scale(
              scale: 3,
              child: const CircularProgressIndicator(
                strokeWidth: 1,
              ),
            ),
          );
        }
      },
    );
  }
}
