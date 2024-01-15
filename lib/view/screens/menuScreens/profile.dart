import 'package:flutter/material.dart';
import 'package:tobeto_app/view/screens/menuScreens/profileScreens/certificate.dart';
import 'package:tobeto_app/view/screens/menuScreens/profileScreens/competency_badge.dart';
import 'package:tobeto_app/view/screens/menuScreens/profileScreens/education_life.dart';
import 'package:tobeto_app/view/screens/menuScreens/profileScreens/experience.dart';
import 'package:tobeto_app/view/screens/menuScreens/profileScreens/foreign_language.dart';
import 'package:tobeto_app/view/screens/menuScreens/profileScreens/personal_info.dart';
import 'package:tobeto_app/view/screens/menuScreens/profileScreens/setting.dart';
import 'package:tobeto_app/view/screens/menuScreens/profileScreens/skills.dart';
import 'package:tobeto_app/view/screens/menuScreens/profileScreens/tobetoSuccesModelAtwork.dart';
import 'package:tobeto_app/view/screens/menuScreens/profileScreens/tobeto_level_test.dart';

class Profile extends StatelessWidget {
  final Map<String, dynamic> profileData = {
    'Kişisel Bilgiler': PersonalInfo(),
    'Deneyimlerm': Experience(),
    'Yetkinliklerim': Skills(),
    'Yabancı dillerim': ForeignLanguage(),
    'Sertifikalarım': Certificate(),
    'Medya Hesaplarım': Experience(),
    'Tobeto işte başarı modelim': TobetoSuccesModelAtwork(),
    'Tobeto seviye testlereim': TobetoLevelTest(),
    'Yetkinlik rozetlerim': CompetencyBadge(),
    'Activite Haritam': Experience(),
    'Eğitim hayatım ve deneyimlerim': EducationLife(),
    'Ayarlar': Setting(),
  };

  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> keys = profileData.keys.toList();
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: keys.length,
                itemBuilder: (context, index) {
                  String key = keys[index];
                  return ListTile(
                    title: Text(key,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isDarkMode ? Colors.white : Colors.black)),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      dynamic selectedClass = profileData[key];
                      if (selectedClass is Widget) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => selectedClass),
                        );
                      } else {
                        print("Belirtilen sınıf bulunamadı");
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
