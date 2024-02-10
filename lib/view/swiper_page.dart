import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/bloc/catalog/catalog_bloc.dart';
import 'package:tobeto_app/bloc/catalog/catalog_event.dart';
import 'package:tobeto_app/view/screens/menu/menu_screen.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/view/screens/menu/calender.dart';
import 'package:tobeto_app/view/screens/menu/catalog.dart';
import 'package:tobeto_app/view/screens/home_page.dart';
import 'package:tobeto_app/view/screens/menu/profile.dart';
import 'package:tobeto_app/view/screens/menu/reviews.dart';

/* class SwiperPage extends StatefulWidget {
  const SwiperPage({Key? key}) : super(key: key);

  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  var activeScreenName = "Ana Sayfa";

  void changeScreen(String selectedMenuName) {
    setState(() {
      activeScreenName = selectedMenuName;
    });
  }

  @override
  Widget build(BuildContext context) {
    final menuWidgets = {
      "Ana Sayfa": const HomePage(),
      "Değerlendirmeler": const Reviews(),
      "Profilim": Profile(),
      "Katalog": const Catalog(),
      "Takvim": Calender(),
    };

    final selectedWidget = menuWidgets[activeScreenName];

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: TobetoAppColor.colorSchemeLight.primary,
        title: Text(
          activeScreenName,
          style: TextStyle(
            color: TobetoAppColor.backgroundLight,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          /*   if (activeScreenName == "Takvim")
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print("searchicon");
                  },
                ),
                IconButton(
                  icon: Icon(Icons.filter_list_alt),
                  onPressed: () {
                    Calender().calenderAddIcon(context);
                  },
                ),
              ],
            ),
          if (activeScreenName == "Katalog")
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Catalog().catalogAddSearchIcon(context);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.filter_list_alt),
                  onPressed: () {
                    Catalog().catalogAddIcon(context);
                  },
                ),
              ],
            ), */
        ],
      ),
      drawer: MenuScreen(
        selectedMenuItem: ((menuName) => changeScreen(menuName)),
      ),
      body: selectedWidget,
    );
  }
}
 */