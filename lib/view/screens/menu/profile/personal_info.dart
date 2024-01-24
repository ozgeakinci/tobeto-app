import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/utilities.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  TextEditingController adController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişisel Bilgilerim"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
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
              padding: const EdgeInsets.all(15.0),
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
                  SizedBox(height: ProjectUtilities.projectHeight_24),
                  _buildTextField("Adınız"),
                  SizedBox(height: ProjectUtilities.projectHeight_24),
                  _buildTextField("Soy Adınız"),
                  SizedBox(height: ProjectUtilities.projectHeight_24),
                  _buildPhoneNumberField(),
                  SizedBox(height: ProjectUtilities.projectHeight_24),
                  _buildDateOfBirthField(),
                  SizedBox(height: ProjectUtilities.projectHeight_24),
                  _buildTextField("TC Kimlik No"),
                  SizedBox(height: ProjectUtilities.projectHeight_24),
                  _buildTextField("E-posta"),
                  SizedBox(height: ProjectUtilities.projectHeight_24),
                  _buildTextField("Ülke il İlçe Seçilecek"),
                  SizedBox(height: ProjectUtilities.projectHeight_24),
                  _buildAboutMeField(),
                  SizedBox(height: ProjectUtilities.projectHeight_24),
                  _buildSaveButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
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

  Widget _buildTextField(String labelText) {
    return TextFormField(
      controller: adController,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
      ),
      style: TextStyle(fontSize: 15),
    );
  }

  Widget _buildPhoneNumberField() {
    return TextFormField(
      controller: adController,
      decoration: const InputDecoration(
        labelText: "Telefon Numarası",
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        prefixText: '+90 ', // Alan kodu veya ülke kodu ekleyebilirsiniz
      ),
      style: TextStyle(fontSize: 15),
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(13),
      ],
    );
  }

  Widget _buildDateOfBirthField() {
    return TextFormField(
      controller: adController,
      decoration: InputDecoration(
        labelText: "Doğum Tarihiniz",
        border: OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () {
            print("Tarih seçme açılacak");
          },
        ),
      ),
      style: TextStyle(fontSize: 15),
    );
  }

  Widget _buildAboutMeField() {
    return TextFormField(
      controller: aboutMeController,
      maxLines: null,
      decoration: InputDecoration(
        labelText: "Hakkımda",
        border: OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
      ),
      style: TextStyle(fontSize: 15),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        print("Kaydet Tıklandı");
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
