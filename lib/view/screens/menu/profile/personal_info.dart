import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/bloc/user/user_event.dart';
import 'package:tobeto_app/bloc/user/user_state.dart';
import 'package:tobeto_app/model/user_model.dart';
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
  DateTime? _selectedDate;

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
                              key: _formKey,
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
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            CustomTextField(
                                                labelText: _selectedDate
                                                    .toString()
                                                    .split(' ')[0],
                                                initialValue:
                                                    state.birthDate.toString()),
                                            Positioned(
                                              right: 20,
                                              top: 0,
                                              bottom: 0,
                                              child: IconButton(
                                                icon: const Icon(
                                                    Icons.calendar_month),
                                                onPressed: () async {
                                                  DateTime? pickedDate =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime.now(),
                                                  );

                                                  if (pickedDate != null) {
                                                    setState(() {
                                                      _selectedDate =
                                                          pickedDate;
                                                    });
                                                  }
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomTextField(
                                    labelText: 'Hakkımda',
                                    initialValue: state.about,
                                    onSaved: (value) => _about = value!,
                                  ),
                                  SizedBox(
                                      height:
                                          ProjectUtilities.projectHeight_24),
                                  ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                        }

                                        UserModel updatedUser = UserModel(
                                          username: state.username,
                                          department: state.department,
                                          email: state.email,
                                          applicationStatus:
                                              state.applicationStatus,
                                          about: _about,
                                          birthDate: _selectedDate != null
                                              ? _selectedDate!
                                              : DateTime.now(),
                                        );

                                        context.read<UserBloc>().add(
                                            SendUserInfo(user: updatedUser));
                                      },
                                      child: Text('Kaydet'))
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

  // Widget _buildSaveButton() {
  //   return ElevatedButton(
  //     onPressed: () {
  //       print('butona tıklandı');

  //       if (_formKey.currentState != null &&
  //           _formKey.currentState!.validate()) {
  //         // Formu kaydet
  //         _formKey.currentState!.save();
  //       }
  //     },
  //     style: ElevatedButton.styleFrom(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(8),
  //       ),
  //     ),
  //     child: Text("Kaydet"),
  //   );
  // }
}
