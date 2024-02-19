import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/bloc/user/user_event.dart';
import 'package:tobeto_app/bloc/user/user_state.dart';
import 'package:tobeto_app/models/user_model.dart';
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
  List<String>? _experiences;
  int _phoneNumber = 90;

  File? _pickedFile;

  Future<XFile?> _pickImage() async {
    return await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 150);
  }

  void _uploadImage() async {
    if (_pickedFile != null) {
      final user = firebaseAuthInstance.currentUser;
      final storageRef = firebaseStorageInstance
          .ref()
          .child("profile_images")
          .child("${user!.uid}.jpg");

      await storageRef.putFile(_pickedFile!);

      final url = await storageRef.getDownloadURL();

      setState(() {
        _urlImage = url;
      });
    }
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
                          CircleAvatar(
                            maxRadius: 60,
                            child: _pickedFile != null
                                ? CircleAvatar(
                                    radius: 60,
                                    backgroundColor: Colors.grey,
                                    foregroundImage: FileImage(_pickedFile!),
                                  )
                                : state.urlImage != null
                                    ? CircleAvatar(
                                        radius: 60,
                                        backgroundColor: Colors.grey,
                                        backgroundImage:
                                            NetworkImage(state.urlImage!),
                                      )
                                    : const CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Colors.grey,
                                      ),
                          ),
                          SizedBox(height: ProjectUtilities.projectHeight_24),
                          TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const SizedBox(height: 15),
                                        Container(
                                          width: 72,
                                          height: 72,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                width: 2,
                                                color: const Color.fromARGB(
                                                    255, 214, 213, 213)),
                                            color: TobetoAppColor.textColor
                                                .withOpacity(0.1),
                                          ),
                                          child: CircleAvatar(
                                            maxRadius: 50,
                                            child: state.urlImage != null
                                                ? CircleAvatar(
                                                    radius: 35,
                                                    backgroundColor:
                                                        Colors.grey,
                                                    backgroundImage:
                                                        NetworkImage(
                                                            state.urlImage!),
                                                  )
                                                : Image.asset(
                                                    'assets/images/profile_icon.png'),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        TextButton(
                                          onPressed: () async {
                                            XFile? pickedImage =
                                                await _pickImage();
                                            if (pickedImage != null) {
                                              setState(() {
                                                _pickedFile =
                                                    File(pickedImage.path);
                                              });
                                            }
                                            _uploadImage();

                                            Navigator.pop(context);
                                          },
                                          child: const Text("Resim Çek"),
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
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
                                  CustomTextField(
                                    labelText: 'Deneyimler',
                                    initialValue:
                                        (state.userExperiences != null)
                                            ? (state.userExperiences!
                                                    as List<String>)
                                                .join(', ')
                                            : '',
                                    // Deneyimleri kullanıcıdan almak için gerekli düzenlemeler
                                    onSaved: (value) {
                                      _experiences = value!
                                          .split(',')
                                          .map((e) => e.trim())
                                          .toList();
                                    },
                                    maxLines: 8,
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
                                            userImage: _pickedFile != null
                                                ? _urlImage
                                                : state.urlImage,
                                            userExperiences: _experiences);
                                        // UserModel içindeki deneyimleri güncelle
                                        updatedUser = updatedUser.copyWith(
                                            experiences: _experiences);

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
}
