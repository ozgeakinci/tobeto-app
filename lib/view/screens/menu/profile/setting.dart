import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_event.dart';
import 'package:tobeto_app/bloc/auth/auth_state.dart';
import 'package:tobeto_app/language/language_items.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/screens/reset_password_page.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';
import 'package:tobeto_app/view/widgets/custom_textfield.dart';

class Setting extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _email = '';

  void _onResetPasswordPressed(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<AuthBloc>().add(ResetPassword(email: _email));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is PasswordResetEmailSent) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ResetPasswordPage()),
          );
        } else if (state is PasswordResetError) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Hata'),
                content: Text('Sistemde kayıtlı mail adresi bulunamadı'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Tamam'),
                  ),
                ],
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppbar(title: 'Şifremi Değiştir'),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) => _email = value!,
                    labelText: LanguageItems.hintEmailText,
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      _onResetPasswordPressed(context);
                    },
                    child: const Text('Şifremi Sıfırla'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// class SettingButton extends StatelessWidget {
//   const SettingButton({
//     super.key,
//     required this.backgroundColor,
//     required this.title,
//   });
//   final Color backgroundColor;
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {},
//       style: ElevatedButton.styleFrom(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//           fixedSize: const Size(170, 24),
//           backgroundColor: backgroundColor),
//       child: Text(
//         title,
//       ),
//     );
//   }
// }
