import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/bloc/user/user_event.dart';
import 'package:tobeto_app/bloc/user/user_state.dart';
import 'package:tobeto_app/model/user_model.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';
import 'package:tobeto_app/view/widgets/custom_textfield.dart';

final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseStorageInstance = FirebaseStorage.instance;

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final _formKey = GlobalKey<FormState>();
  String _about = '';
  String? _urlImage;
  DateTime? _selectedDate;
  int _phoneNumber = 90;

  File? _pickedFile;

  void _pickImage() async {
    final image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 150);

    if (image != null) {
      setState(() {
        _pickedFile = File(image.path);
      });
    }
  }

  void _uploadImage(File? picketFileImage) async {
    print("Yüklee");
    final user = firebaseAuthInstance.currentUser;
    final storageRef = firebaseStorageInstance
        .ref()
        .child("profile_images")
        .child("${user!.uid}.jpg");

    await storageRef.putFile(picketFileImage!);

    final url = await storageRef.getDownloadURL();

    _urlImage = url;
  }

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
                          state.urlImage != null
                              ? CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.grey,
                                  backgroundImage: NetworkImage(state
                                      .urlImage!), // Firebase'den gelen URL buraya gelecek
                                )
                              : Container(
                                  width: 72,
                                  height: 72,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2,
                                        color:
                                            Color.fromARGB(255, 214, 213, 213)),
                                    color: TobetoAppColor.textColor
                                        .withOpacity(0.1),
                                  ),
                                  child: Image.asset(
                                      'assets/images/profile_icon.png')),
                          SizedBox(height: ProjectUtilities.projectHeight_24),
                          TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: Column(children: [
                                      const SizedBox(height: 15),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 30,
                                          ),
                                          SizedBox(
                                            height: 60,
                                          ),
                                          if (_pickedFile != null)
                                            CircleAvatar(
                                              radius: 40,
                                              backgroundColor: Colors.grey,
                                              foregroundImage:
                                                  FileImage(_pickedFile!),
                                            ),
                                          TextButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlertDialog(
                                                    title: const Text(
                                                        'AlertDialog Title'),
                                                    content: const Text(
                                                        'AlertDialog description'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            _pickImage(),
                                                        child: const Text(
                                                            'Kamera'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              child: const Text("Resim Seç")),
                                          ElevatedButton(
                                              onPressed: () {
                                                _uploadImage(_pickedFile);
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Yükle")),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      )
                                    ]),
                                  );
                                },
                              );
                            },
                            child: Text(
                              'Profil Fotoğrafı Ekle',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color:
                                      TobetoAppColor.colorSchemeLight.primary),
                            ),
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
                                                        ?.toString()
                                                        .split(' ')
                                                        .first ??
                                                    'Doğum Tarihi',
                                                initialValue: state.birthDate
                                                    .toString()
                                                    .split(' ')
                                                    .first),
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
                                    maxLines: 8,
                                  ),
                                  CustomTextField(
                                    labelText: 'Telefon Numaranız',
                                    initialValue:
                                        state.phoneNumber.toString() != null
                                            ? state.phoneNumber.toString()
                                            : '+90',
                                    keyboardType: TextInputType.phone,
                                    onSaved: (value) {
                                      try {
                                        _phoneNumber = int.parse(value!);
                                      } catch (e) {
                                        print(
                                            "Hata: $e"); // Sayısal bir değere dönüştürme hatası
                                      }
                                    },
                                  ),
                                  SizedBox(
                                      height:
                                          ProjectUtilities.projectHeight_24),
                                  ElevatedButton(
                                      onPressed: () {
                                        print("Kaydetttt---------");
                                        print(_urlImage);
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
                                                : state.birthDate,
                                            phoneNumber: _phoneNumber,
                                            userImage: _urlImage);

                                        context.read<UserBloc>().add(
                                            SendUserInfo(user: updatedUser));

                                        Navigator.pop(context);
                                      },
                                      child: const Text('Kaydet'))
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
