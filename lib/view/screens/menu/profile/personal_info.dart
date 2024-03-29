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
  int _phoneNumber = 90;
  String _userName = '';
  File? _pickedFile;
  bool _isFormChanged = false;

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
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        appBar: const CustomAppbar(
          title: 'Kişisel Bilgilerim',
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoaded) {
              return SingleChildScrollView(
                child: Padding(
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
                                      : CircleAvatar(
                                          radius: 50,
                                          child: Icon(Icons.person),
                                          backgroundColor: isDarkMode
                                              ? TobetoAppColor
                                                  .inputDarkBackground
                                              : TobetoAppColor.buttonColorLight,
                                        ),
                            ),
                            SizedBox(height: ProjectUtilities.projectHeight_24),
                            TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  backgroundColor: isDarkMode
                                      ? TobetoAppColor.inputDarkBackground
                                      : TobetoAppColor.buttonColorLight,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(50.0),
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
                                                  color: TobetoAppColor
                                                      .selecetedItemColor),
                                              color: TobetoAppColor
                                                  .inputDarkBackground
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
                                                  : Icon(Icons.person),
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
                                    color: TobetoAppColor
                                        .colorSchemeLight.primary),
                              ),
                            ),
                            Form(
                              onChanged: () {
                                setState(() {
                                  _isFormChanged = true;
                                });
                              },
                              key: _formKey,
                              child: Column(
                                children: [
                                  CustomTextField(
                                    labelText: 'Adınız Soyadınız*',
                                    initialValue: state.username,
                                    onSaved: (value) => _userName = value!,
                                    prefixIcon: Icons.person,
                                  ),
                                  CustomTextField(
                                    labelText: 'E-Posta*',
                                    enabled: false,
                                    initialValue: state.email,
                                    prefixIcon: Icons.mail,
                                  ),
                                  CustomTextField(
                                    labelText: 'Bölüm',
                                    initialValue: state.department,
                                    enabled: false,
                                    prefixIcon: Icons.business_sharp,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            CustomTextField(
                                              prefixIcon: Icons.date_range,
                                              labelText: _selectedDate
                                                      ?.toString()
                                                      .split(' ')
                                                      .first ??
                                                  'Doğum Tarihi',
                                              initialValue: state.birthDate
                                                  .toString()
                                                  .split(' ')
                                                  .first,
                                            ),
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
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          ProjectUtilities.projectHeight_8,
                                      vertical: ProjectUtilities.sizeWidth_16,
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon: Padding(
                                              padding: EdgeInsets.only(top: 0),
                                              child: Icon(Icons.info)),
                                          alignLabelWithHint: true,
                                          labelText: 'Hakkımda',
                                          filled: true,
                                          fillColor: isDarkMode
                                              ? TobetoAppColor
                                                  .inputDarkBackground
                                              : TobetoAppColor.backgroundLight,
                                          border: OutlineInputBorder(
                                              borderSide: isDarkMode
                                                  ? BorderSide.none
                                                  : BorderSide(),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)))),
                                      initialValue: state.about,
                                      onSaved: (value) => _about = value!,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            ProjectUtilities.projectHeight_8,
                                        vertical:
                                            ProjectUtilities.sizeWidth_16),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText: 'Telefon Numaranız',
                                          hintText: '905434303212',
                                          prefixIcon: Icon(Icons.phone),
                                          filled: true,
                                          fillColor: isDarkMode
                                              ? TobetoAppColor
                                                  .inputDarkBackground
                                              : TobetoAppColor.backgroundLight,
                                          border: OutlineInputBorder(
                                              borderSide: isDarkMode
                                                  ? BorderSide.none
                                                  : BorderSide(),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)))),
                                      maxLength: 12,
                                      initialValue:
                                          state.phoneNumber.toString(),
                                      keyboardType: TextInputType.phone,
                                      validator: (value) {
                                        if (value != null && value.isNotEmpty) {
                                          if (value.length != 12) {
                                            return 'Telefon numarası 12 haneli olmalıdır';
                                          } else if (!RegExp(r'^[0-9]+$')
                                              .hasMatch(value)) {
                                            return 'Telefon numarası sadece rakamlardan oluşmalıdır';
                                          }
                                        }
                                        return null; // Hata yoksa null döndür
                                      },
                                      onSaved: (value) {
                                        try {
                                          _phoneNumber = int.parse(value!);
                                        } catch (e) {
                                          print(
                                              "Hata: $e"); // Sayısal bir değere dönüştürme hatası
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          ProjectUtilities.projectHeight_24),
                                  ElevatedButton(
                                      onPressed: _isFormChanged
                                          ? () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _formKey.currentState!.save();
                                              }

                                              UserModel updatedUser = UserModel(
                                                  username: _userName != null
                                                      ? _userName
                                                      : state.username,
                                                  department: state.department,
                                                  email: state.email,
                                                  applicationStatus:
                                                      state.applicationStatus,
                                                  about: _about,
                                                  birthDate:
                                                      _selectedDate != null
                                                          ? _selectedDate!
                                                          : state.birthDate,
                                                  phoneNumber: _phoneNumber,
                                                  userImage: _pickedFile != null
                                                      ? _urlImage
                                                      : state.urlImage,
                                                  experiences:
                                                      state.experiences,
                                                  userEducations:
                                                      state.userEducations,
                                                  skills: state.skills,
                                                  languages: state.languages);

                                              context.read<UserBloc>().add(
                                                  SendUserInfo(
                                                      user: updatedUser));

                                              if ((state.username !=
                                                      updatedUser.username ||
                                                  state.about !=
                                                      updatedUser.about ||
                                                  state.birthDate !=
                                                      updatedUser.birthDate ||
                                                  state.phoneNumber !=
                                                      updatedUser
                                                          .phoneNumber)) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        "Bilgileriniz başarıyla kaydedildi."),
                                                    backgroundColor:
                                                        TobetoAppColor
                                                            .colorSchemeLight
                                                            .secondary,
                                                    duration:
                                                        Duration(seconds: 1),
                                                  ),
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Güncel bilgi bulunamadı."),
                                                  backgroundColor: Colors.red,
                                                  duration:
                                                      Duration(seconds: 5),
                                                ));
                                                setState(() {
                                                  _isFormChanged = false;
                                                });
                                              }
                                            }
                                          : null,
                                      child: const Text('Kaydet'))
                                ],
                              ),
                            )
                          ],
                        ),
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
