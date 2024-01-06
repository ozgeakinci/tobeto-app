import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final String gibiIlkkan =
      "Yahşı günde yar yahşıdır yaman günde yetiş gardaş....Kuki İlkkan";

  TextEditingController adController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kişisel Bilgilerim"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Color.fromARGB(255, 226, 223, 223),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(gibiIlkkan),
                  const SizedBox(height: 20),
                  _buildUserPhoto(),
                  const SizedBox(height: 20),
                  _buildTextField("Adınız"),
                  const SizedBox(height: 20),
                  _buildTextField("Soy Adınız"),
                  const SizedBox(height: 20),
                  _buildPhoneNumberField(),
                  const SizedBox(height: 20),
                  _buildDateOfBirthField(),
                  const SizedBox(height: 20),
                  _buildTextField("TC Kimlik No"),
                  const SizedBox(height: 20),
                  _buildTextField("E-posta"),
                  const SizedBox(height: 20),
                  _buildTextField("Ülke il İlçe Seçilecek"),
                  const SizedBox(height: 20),
                  _buildAboutMeField(),
                  const SizedBox(height: 20),
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
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            width: 2, color: const Color.fromARGB(255, 150, 148, 148)),
        color: const Color.fromARGB(255, 208, 203, 203),
      ),
      child: const Icon(Icons.person,
          size: 60, color: const Color.fromARGB(255, 137, 132, 132)),
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
