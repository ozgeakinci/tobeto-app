import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/utilities.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ayarlar"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ProjectUtilities.paddingAll_8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: TobetoAppColor.backgroundLight),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTextField("Örn:123456", "Eski Şifre*"),
                    _buildTextField("Örn:1234567", "Yeni Şifre*"),
                    _buildTextField("Örn:1234567", "Yeni Şifre Tekrar*"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ProjectUtilities.paddingAll_16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SettingButton(
                      backgroundColor: TobetoAppColor.colorSchemeLight.primary,
                      title: 'Şifre Değiştir',
                    ),
                    SettingButton(
                      backgroundColor: TobetoAppColor.colorSchemeLight.error,
                      title: 'Üyeliği Sonlandır',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, String titleText) {
    return Padding(
      padding: EdgeInsets.all(ProjectUtilities.paddingAll_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleText),
          TextFormField(
            controller: null,
            decoration: InputDecoration(
              labelText: labelText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingButton extends StatelessWidget {
  const SettingButton({
    super.key,
    required this.backgroundColor,
    required this.title,
  });
  final Color backgroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          fixedSize: const Size(170, 24),
          backgroundColor: backgroundColor),
      child: Text(
        title,
      ),
    );
  }
}
