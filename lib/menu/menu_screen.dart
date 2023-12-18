import 'package:flutter/material.dart';
import 'package:tobeto_app/datas/menu_data.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key, required this.selectedMenuItem})
      : super(key: key);

  final void Function(String selectedMenuName) selectedMenuItem;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: SizedBox(
              height: 100,
              child: Stack(
                children: [
                  Positioned(
                    child: Image.asset(
                      'assets/images/tobeto-logo.png',
                      width: 170,
                    ),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Color.fromARGB(255, 172, 169, 169),
                          size: 30,
                        ),
                      )),
                ],
              ),
            ),
          ),
          for (final menuItem in menus)
            Row(
              children: [
                Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            selectedMenuItem(menuItem.name);
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [Text(menuItem.name), menuItem.menuIcon],
                          ),
                        ))),
              ],
            ),
          /*    ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              Color.fromARGB(255, 211, 211, 211), // Çizgi rengi
                          width: 1.0, // Çizgi kalınlığı
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(newUserWatch))),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 151, 148, 148),
                  child: Icon(
                    Icons.person_pin_outlined,
                    color: Colors.red,
                    size: 40,
                  ),
                )
              ],
            ),
            onTap: () {
              print("Tıklandı");
            },
          ), */
        ],
      ),
    );
  }
}
