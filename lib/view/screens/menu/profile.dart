import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_event.dart';
import 'package:tobeto_app/bloc/calendar/calendar_bloc.dart';
import 'package:tobeto_app/bloc/calendar/calendar_event.dart';
import 'package:tobeto_app/bloc/educations/educations_bloc.dart';
import 'package:tobeto_app/bloc/educations/educations_event.dart';
import 'package:tobeto_app/bloc/notifications/notifications_bloc.dart';
import 'package:tobeto_app/bloc/notifications/notifications_event.dart';
import 'package:tobeto_app/bloc/user/user_bloc.dart';
import 'package:tobeto_app/bloc/user/user_event.dart';
import 'package:tobeto_app/bloc/user/user_state.dart';
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
import 'package:tobeto_app/view/widgets/custom_appbar.dart';

class Profile extends StatelessWidget {
  final Map<String, dynamic> profileData = {
    'Kişisel Bilgiler': PersonalInfo(),
    'Deneyimlerm': Experience(),
    'Yetkinliklerim': Skills(),
    'Yabancı dillerim': ForeignLanguage(),
    'Sertifikalarım': Certificate(),
    // 'Medya Hesaplarım': Experience(),
    'Tobeto işte başarı modelim': TobetoSuccesModelAtwork(),
    'Tobeto seviye testlerim': TobetoLevelTest(),
    'Yetkinlik rozetlerim': CompetencyBadge(),
    // 'Activite Haritam': Experience(),
    'Eğitim hayatım ve deneyimlerim': EducationLife(),
    'Şifremi Değiştir': Setting(),
  };

  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> keys = profileData.keys.toList();
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: CustomAppbar(
        title: 'Profilim',
        centerTitle: true,
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            context.read<UserBloc>().add(FetchUserRequested());
          }
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
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                      ),
                    ),
                    // color: TobetoAppColor.primaryBackgroundColor,
                    height: 160,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          maxRadius: 32,
                          child: state.urlImage != null
                              ? CircleAvatar(
                                  radius: 40,
                                  backgroundColor: Colors.grey,
                                  backgroundImage:
                                      NetworkImage(state.urlImage!),
                                )
                              : Text(state.usernameInitials),
                        ),
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
                      child: const Text('Çıkış yap'),
                      onPressed: () {
                        context.read<UserBloc>().add(ResetUserEvent());
                        context.read<CalendarBloc>().add(ResetCalendarEvent());
                        context
                            .read<EducationsBloc>()
                            .add(ResetEducationsEvent());
                        context
                            .read<NotificationBloc>()
                            .add(ResetNotificationsEvent());
                        context.read<AuthBloc>().add(Logout());
                      },
                    ),
                  ),
                )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
