import 'package:flutter/material.dart';
import 'package:tobeto_app/view/screens/menuScreens/profileScreens/experience.dart';
import 'package:tobeto_app/view/screens/menuScreens/profileScreens/personal_info.dart';
import 'package:tobeto_app/view/screens/menuScreens/profileScreens/skills.dart';

class Profile extends StatelessWidget {
  final Map<String, dynamic> profileData = {
    'Kişisel Bilgiler': PersonalInfo(),
    'Deneyimlerm': Experience(),
    'Yetkinliklerim': Skills(),
    'Yabancı dillerim': Experience(),
    'Sertifikalarım': Experience(),
    'Medya Hesaplarım': Experience(),
    'Tobeto işte başarı modelim': Experience(),
    'Tobeto seviye testlereim': Experience(),
    'Yetkinlik rozetlerim': Experience(),
    'Activite Haritam': Experience(),
    'Eğitim hayatım ve deneyimlerim': Experience(),
    'Ayarlar': Experience(),

    // Geri Kalanlar
    /*        'Kişisel Bilgiler': PersonalInfo(),
    'Deneyimlerm': Experience(),
    'Yetkinliklerim': Skills(),
    'Yabancı dillerim': ForeignLanguages(),
    'Sertifikalarım': Certifications(),
    'Medya Hesaplarım': SocialMediaAccounts(),
    'Tobeto işte başarı modelim': TobetoSuccessModelAtWork(),
    'Tobeto seviye testlereim': TobetoLevelTests(),
    'Yetkinlik rozetlerim': SkillBadges(),
    'Activite Haritam': ActivityMap(),
    'Eğitim hayatım ve deneyimlerim': EducationAndExperiences(),
    'Ayarlar': Settings(), */
  };

  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> keys = profileData.keys.toList();

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
                    title: Text(
                      key,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: Icon(Icons.chevron_right),
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
