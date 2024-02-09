import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_event.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/bloc/user/user_event.dart';
import 'package:tobeto_app/bloc/user/user_state.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/view/screens/menu/profile/certificate.dart';
import 'package:tobeto_app/view/screens/menu/profile/competency_badge.dart';
import 'package:tobeto_app/view/screens/menu/profile/education_life.dart';
import 'package:tobeto_app/view/screens/menu/profile/experience.dart';
import 'package:tobeto_app/view/screens/menu/profile/foreign_language.dart';
import 'package:tobeto_app/view/screens/menu/profile/personal_info.dart';
import 'package:tobeto_app/view/screens/menu/profile/setting.dart';
import 'package:tobeto_app/view/screens/menu/profile/skills.dart';
import 'package:tobeto_app/view/screens/menu/profile/tobetoSuccesModelAtwork.dart';
import 'package:tobeto_app/view/screens/menu/profile/tobeto_level_test.dart';

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
      appBar: AppBar(
        // backgroundColor: TobetoAppColor.primaryBackgroundColor,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF6A00FF),
                Color(0xFF9013FE).withOpacity(0.9),
                Color(0xFFC100FF).withOpacity(0.9),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profilim',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF6A00FF),
                          Color(0xFF9013FE).withOpacity(0.9),
                          Color(0xFFC100FF).withOpacity(0.9),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    // color: TobetoAppColor.primaryBackgroundColor,
                    height: 160,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                            maxRadius: 32, child: Text(state.usernameInitials)),
                        Text(
                          state.username,
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    String key = keys[index];
                    return ListTile(
                      title: Text(key,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors.black)),
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
                  }, childCount: keys.length),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Colors.white),
                      child: const Text('Çıkış yap'),
                      onPressed: () {
                        context.read<UserBloc>().add(ResetUserEvent());
                        context.read<AuthBloc>().add(Logout());
                      },
                    ),
                  ),
                )
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
