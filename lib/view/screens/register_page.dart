import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_event.dart';
import 'package:tobeto_app/bloc/auth/auth_state.dart';
import 'package:tobeto_app/language/language_items.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
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
    'Mobil Uygulama Geliştirme',
    'Yazılım Kalite ve Test',
    'Veri Bilimi',
    'Siber Güvenlik',
    'Sistem ve Network',
    'Dijital Pazarlama',
  ];

  String? _department;

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
        if (state is NotAuthenticated) {
          if (state.errorMessage != null) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                  backgroundColor: Colors.red,
                ),
              );
            });

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
                          height: ProjectUtilities.projectHeight_16,
                        ),
                        CustomTextField(
                          externalPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          onSaved: (value) => _username = value!,
                          labelText: LanguageItems.hintNameText,
                          prefixIcon: Icons.person_2_rounded,
                        ),
                        CustomTextField(
                          externalPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          onSaved: (value) => _email = value!,
                          keyboardType: TextInputType.emailAddress,
                          labelText: LanguageItems.hintEmailText,
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
                          externalPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          onSaved: (value) => _password = value!,
                          labelText: LanguageItems.hintTextPassword,
                          prefixIcon: Icons.lock,
                          obscureText: true,
                          maxLines: 1,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.92,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            child: DropdownButtonFormField<String>(
                              dropdownColor: isDarkMode
                                  ? TobetoAppColor.inputDarkBackground
                                  : TobetoAppColor.backgroundLight,
                              value: _department,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Ders türü boş olamaz';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: isDarkMode
                                      ? TobetoAppColor.inputDarkBackground
                                      : TobetoAppColor.backgroundLight,
                                  prefixIcon: Icon(Icons.cast_for_education),
                                  border: OutlineInputBorder(
                                    borderSide: isDarkMode
                                        ? BorderSide.none
                                        : BorderSide(
                                            color: TobetoAppColor.textColor),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: isDarkMode
                                        ? BorderSide.none
                                        : BorderSide(
                                            color: TobetoAppColor.textColor),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: isDarkMode
                                          ? BorderSide.none
                                          : BorderSide(
                                              color: TobetoAppColor.textColor),
                                      borderRadius: BorderRadius.circular(8))),
                              hint: Text(
                                'Ders Türünü Seçiniz',
                                style:
                                    TextStyle(color: TobetoAppColor.textColor),
                              ),
                              onSaved: (value) => _department = value!,
                              items: departmentList.map((type) {
                                return DropdownMenuItem<String>(
                                  value: type,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    type,
                                    style: TextStyle(
                                      color: TobetoAppColor.textColor,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {},
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ProjectUtilities.projectHeight_16,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.84,
                                  MediaQuery.of(context).size.height * 0.067)),
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
          } else {
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
                          height: ProjectUtilities.projectHeight_16,
                        ),
                        CustomTextField(
                          externalPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          onSaved: (value) => _username = value!,
                          labelText: LanguageItems.hintNameText,
                          prefixIcon: Icons.person_2_rounded,
                        ),
                        CustomTextField(
                          externalPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          onSaved: (value) => _email = value!,
                          keyboardType: TextInputType.emailAddress,
                          labelText: LanguageItems.hintEmailText,
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
                          externalPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          onSaved: (value) => _password = value!,
                          labelText: LanguageItems.hintTextPassword,
                          prefixIcon: Icons.lock,
                          obscureText: true,
                          maxLines: 1,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.92,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            child: DropdownButtonFormField<String>(
                              dropdownColor: isDarkMode
                                  ? TobetoAppColor.inputDarkBackground
                                  : TobetoAppColor.backgroundLight,
                              value: _department,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Ders türü boş olamaz';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: isDarkMode
                                      ? TobetoAppColor.inputDarkBackground
                                      : TobetoAppColor.backgroundLight,
                                  prefixIcon: Icon(Icons.cast_for_education),
                                  border: OutlineInputBorder(
                                    borderSide: isDarkMode
                                        ? BorderSide.none
                                        : BorderSide(
                                            color: TobetoAppColor.textColor),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: isDarkMode
                                        ? BorderSide.none
                                        : BorderSide(
                                            color: TobetoAppColor.textColor),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: isDarkMode
                                          ? BorderSide.none
                                          : BorderSide(
                                              color: TobetoAppColor.textColor),
                                      borderRadius: BorderRadius.circular(8))),
                              hint: Text(
                                'Ders Türünü Seçiniz',
                                style:
                                    TextStyle(color: TobetoAppColor.textColor),
                              ),
                              onSaved: (value) => _department = value!,
                              items: departmentList.map((type) {
                                return DropdownMenuItem<String>(
                                  value: type,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    type,
                                    style: TextStyle(
                                      color: TobetoAppColor.textColor,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? value) {},
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ProjectUtilities.projectHeight_16,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.84,
                                  MediaQuery.of(context).size.height * 0.067)),
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
        } else {
          return const Center(child: Text("Yükleniyor....."));
        }
      },
    );
  }
}
