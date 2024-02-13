import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/bloc/user/user_state.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';
import 'package:tobeto_app/view/widgets/custom_textfield.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final _formKey = GlobalKey<FormState>();
  String _about = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(
          title: 'Kişisel Bilgilerim',
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoaded) {
              return Padding(
                padding: EdgeInsets.all(ProjectUtilities.paddingAll_16),
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: TobetoAppColor.textColor.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(ProjectUtilities.sizeWidth_8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildUserPhoto(),
                          SizedBox(height: ProjectUtilities.projectHeight_24),
                          Text(
                            'Profil Fotoğrafı Ekle',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: TobetoAppColor.colorSchemeLight.primary),
                          ),
                          Form(
                              child: Column(
                            children: [
                              CustomTextField(
                                labelText: 'Adınız Soyadınız*',
                                initialValue: state.username,
                                enabled: false,
                              ),
                              CustomTextField(
                                labelText: 'E-Posta*',
                                enabled: false,
                                initialValue: state.email,
                              ),
                              CustomTextField(
                                labelText: 'Bölüm',
                                initialValue: state.department,
                                enabled: false,
                              ),
                              CustomTextField(
                                labelText: 'Hakkımda',
                                initialValue: _about,
                                onSaved: (value) => _about = value!,
                              ),
                              SizedBox(
                                  height: ProjectUtilities.projectHeight_24),
                              _buildSaveButton(),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Widget _buildUserPhoto() {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2, color: Color.fromARGB(255, 214, 213, 213)),
        color: TobetoAppColor.textColor.withOpacity(0.1),
      ),
      child: Image.asset('assets/images/profile_icon.png'),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        print('butona tıklandı');

        if (_formKey.currentState != null &&
            _formKey.currentState!.validate()) {
          // Formu kaydet
          _formKey.currentState!.save();

          // Kullanıcının güncellemek istediği verileri al
          // updatedUsername ve updatedEmail zaten formun içinde onSaved ile güncellenmiş durumda

          // UserBloc'tan güncelleme event'ini tetikle
        }
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text("Kaydet"),
    );
  }
}
