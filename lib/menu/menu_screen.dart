import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_bloc.dart';
import 'package:tobeto_app/bloc/auth/auth_event.dart';
import 'package:tobeto_app/datas/menu_data.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/view/screens/login_page.dart';
import 'package:tobeto_app/view/swiper_page.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key, required this.selectedMenuItem})
      : super(key: key);

  final void Function(String selectedMenuName) selectedMenuItem;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    String getCurrentDate() {
      DateTime now = DateTime.now();
      return "${now.year}";
    }

    return Drawer(
      elevation: 1,
      child: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              isDarkMode
                  ? Image.asset(
                      'assets/images/tobeto_logo_dark.png',
                      width: MediaQuery.of(context).size.width * 0.45,
                    )
                  : Image.asset(
                      'assets/images/tobeto_logo_light.png',
                      width: MediaQuery.of(context).size.width * 0.45,
                    ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  color: TobetoAppColor.textColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          for (final menuItem in menus)
            InkWell(
              onTap: () {
                Navigator.pop(context);
                selectedMenuItem(menuItem.name);
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, bottom: 20, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(menuItem.name),
                    menuItem.menuIcon,
                  ],
                ),
              ),
            ),
          const SizedBox(height: 20),
          const Divider(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const SwiperPage()));
              },
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.home_outlined),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Tobeto',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              title: Text(
                "Kullanıcı Adı",
                style: TextStyle(color: TobetoAppColor.textColor),
              ),
              trailing: const CircleAvatar(
                child: Icon(Icons.person_2_outlined),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text(
                'Çıkış Yap',
              ),
              trailing: const Icon(Icons.logout_outlined),
              onTap: () {
                context.read<AuthBloc>().add(Logout());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 38.0,
              left: 8,
            ),
            child: Text(
              ' © ${getCurrentDate()} Tobeto',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
        ],
      ),
    );
  }
}
