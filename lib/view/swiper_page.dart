import 'package:flutter/material.dart';
import 'package:tobeto_app/menu/menu_screen.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/view/screens/menuScreens/calender.dart';
import 'package:tobeto_app/view/screens/menuScreens/catalog.dart';
import 'package:tobeto_app/view/screens/home_page.dart';
import 'package:tobeto_app/view/screens/menuScreens/profile.dart';
import 'package:tobeto_app/view/screens/menuScreens/reviews.dart';

class SwiperPage extends StatefulWidget {
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
      "Ana Sayfa": HomePage(),
      "Değerlendirmeler": const Reviews(),
      "Profilim": Profile(),
      "Katalog": Catalog(),
      "Takvim": Calender(),
    };

    final selectedWidget = menuWidgets[activeScreenName];

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: TobetoAppColor.colorSchemeLight.primary,
        title: Text(
          activeScreenName,
          style: TextStyle(
            color: TobetoAppColor.textColorDark,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          if (activeScreenName == "Takvim")
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
            ),
        ],
      ),
      drawer: MenuScreen(
        selectedMenuItem: ((menuName) => changeScreen(menuName)),
      ),
      body: selectedWidget,
    );
  }
}

