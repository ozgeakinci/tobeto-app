import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/bottom_navbar/bottom_navbar_bloc.dart';
import 'package:tobeto_app/bloc/bottom_navbar/bottom_navbar_event.dart';
import 'package:tobeto_app/bloc/bottom_navbar/bottom_navbar_state.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/view/screens/home_page.dart';
import 'package:tobeto_app/view/screens/menu/calender.dart';
import 'package:tobeto_app/view/screens/menu/catalog.dart';
import 'package:tobeto_app/view/screens/menu/profile.dart';
import 'package:tobeto_app/view/screens/menu/reviews.dart';
import 'package:tobeto_app/view/swiper_page.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavbarBloc, BottomNavbarUpdate>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.currentIndex,
            children: [
              HomePage(),
              Catalog(),
              Calender(),
              Profile(),
              Reviews(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentIndex,
            iconSize: 24,
            selectedItemColor:
                TobetoAppColor.primaryBackgroundColor, // Seçilen ikon rengi
            unselectedItemColor: Colors.black45, //

            onTap: (index) {
              context.read<BottomNavbarBloc>().add(UpdatePageIndexEvent(index));
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Anasayfa',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.play_lesson_outlined,
                ),
                label: 'Katalog',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month_outlined,
                ),
                label: 'Takvim',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_2_outlined,
                ),
                label: 'Profilim',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.rate_review_outlined,
                ),
                label: 'Değerlendirme',
                backgroundColor: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
