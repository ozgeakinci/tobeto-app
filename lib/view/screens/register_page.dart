import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_event.dart';
import 'package:tobeto_app/bloc/auth/auth_state.dart';
import 'package:tobeto_app/language/language_items.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/widgets/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  List<String> departmentList = [
    'Java Fullstack',
    '.NET Fullstack',
    'Mobil Uygulama Geliştirme',
    'Yazılım Kalite ve Test',
    'İş Analisti',
    'Veri Bilimi',
    'Siber Güvenlik',
    'Sistem ve Network',
    'Oyun Yazılımı',
    'Dijital Pazarlama',
    'DevOps'
  ];

  String? _department;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _email = '';
    String _password = '';
    String _username = '';

    void _submit() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        context.read<AuthBloc>().add(Register(
            email: _email,
            password: _password,
            username: _username,
            department: _department!,
            applicationstatus: false));
      }
    }

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          print("AuthInitial İnitial");
        }
        if (state is NotAuthenticated) {
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
                          onSaved: (value) => _email = value!,
                          keyboardType: TextInputType.emailAddress,
                          labelText: LanguageItems.hintEmailText,
                          prefixIcon: Icons.mail),
                      CustomTextField(
                        onSaved: (value) => _password = value!,
                        labelText: LanguageItems.hintTextPassword,
                        prefixIcon: Icons.lock,
                        obscureText: true,
                        maxLines: 1,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.89,
                        height:
                            100, // TextFormField'ın yüksekliği ile aynı olabilir
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          child: DropdownButtonFormField<String>(
                            value: _department,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ders türü boş olamaz';
                              }
                              return null;
                            },
                            hint: const Text('Ders Türünü Seçiniz'),
                            onSaved: (value) => _department = value!,
                            items: departmentList.map((type) {
                              return DropdownMenuItem<String>(
                                value: type,
                                child: Text(type),
                              );
                            }).toList(),
                            onChanged: (String? value) {},
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ProjectUtilities.paddingAll_8,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.89,
                                MediaQuery.of(context).size.height * 0.064)),
                        onPressed: () {
                          _submit();

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                state.errorMessage.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        },
                        child: const Text(LanguageItems.registerText),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
