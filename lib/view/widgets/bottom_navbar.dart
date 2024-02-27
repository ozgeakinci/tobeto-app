import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/bottom_navbar/bottom_navbar_bloc.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/view/screens/home_page.dart';
import 'package:tobeto_app/view/screens/menu/calender.dart';
import 'package:tobeto_app/view/screens/menu/catalog.dart';
import 'package:tobeto_app/view/screens/menu/profile.dart';
import 'package:tobeto_app/view/screens/menu/reviews.dart';

class BottomNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<NavigationBloc, int>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: _buildPage(state),
          ),
          bottomNavigationBar: BlocBuilder<NavigationBloc, int>(
            builder: (context, state) => BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.home_outlined,
                    ),
                    label: 'Anasayfa',
                    backgroundColor: isDarkMode
                        ? TobetoAppColor.inputDarkBackground
                        : TobetoAppColor.backgroundLight),
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.play_lesson_outlined,
                    ),
                    label: 'Katalog',
                    backgroundColor: isDarkMode
                        ? TobetoAppColor.inputDarkBackground
                        : TobetoAppColor.backgroundLight),
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.calendar_month_outlined,
                    ),
                    label: 'Takvim',
                    backgroundColor: isDarkMode
                        ? TobetoAppColor.inputDarkBackground
                        : TobetoAppColor.backgroundLight),
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.person_2_outlined,
                    ),
                    label: 'Profilim',
                    backgroundColor: isDarkMode
                        ? TobetoAppColor.inputDarkBackground
                        : TobetoAppColor.backgroundLight),
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.rate_review_outlined,
                    ),
                    label: 'Değerlendirme',
                    backgroundColor: isDarkMode
                        ? TobetoAppColor.inputDarkBackground
                        : TobetoAppColor.backgroundLight),
              ],
              currentIndex: state,
              onTap: (index) {
                switch (index) {
                  case 0:
                    BlocProvider.of<NavigationBloc>(context)
                        .add(NavigationEvent.Anasayfa);
                    break;
                  case 1:
                    BlocProvider.of<NavigationBloc>(context)
                        .add(NavigationEvent.Katalog);
                    break;
                  case 2:
                    BlocProvider.of<NavigationBloc>(context)
                        .add(NavigationEvent.Takvim);
                    break;
                  case 3:
                    BlocProvider.of<NavigationBloc>(context)
                        .add(NavigationEvent.Profil);
                    break;
                  case 4:
                    BlocProvider.of<NavigationBloc>(context)
                        .add(NavigationEvent.Degerlendirmeler);
                    break;
                }
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildPage(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return HomePage();
      case 1:
        return Catalog();
      case 2:
        return Calender();
      case 3:
        return Profile();
      case 4:
        return Reviews();
      default:
        return const Center(
          child: Text('Yükleniyor...'),
        );
    }
  }
}
