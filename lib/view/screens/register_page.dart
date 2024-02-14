import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_event.dart';
import 'package:tobeto_app/language/language_items.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/screens/login_page.dart';
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
    String _department = '';

    void _submit() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        context.read<AuthBloc>().add(Register(
            email: _email,
            password: _password,
            username: _username,
            department: _department,
            applicationstatus: false));
      }
    }

    return Stack(
      children: [
        Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: ProjectUtilities.projectHeight_32,
                ),
                CustomTextField(
                    onSaved: (value) => _username = value!,
                    labelText: LanguageItems.hintNameText,
                    prefixIcon: Icons.person_2_rounded),
                CustomTextField(
                    onSaved: (value) => _department = value!,
                    labelText: LanguageItems.hintDepartmentText,
                    prefixIcon: Icons.person_2_rounded),
                CustomTextField(
                    onSaved: (value) => _email = value!,
                    labelText: LanguageItems.hintEmailText,
                    prefixIcon: Icons.person_2_rounded),
                CustomTextField(
                  onSaved: (value) => _password = value!,
                  labelText: LanguageItems.hintTextPassword,
                  prefixIcon: Icons.lock,
                  obscureText: true,
                  maxLines: 1,
                ),
                SizedBox(
                  height: ProjectUtilities.paddingAll_8,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.89,
                          MediaQuery.of(context).size.height * 0.064)),
                  onPressed: () {
                    _submit();
                  },
                  child: const Text(LanguageItems.registerText),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
