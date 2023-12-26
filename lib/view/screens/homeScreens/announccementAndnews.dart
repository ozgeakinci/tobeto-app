import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/view/widgets/announccementAndnewsWidgets/natification_card.dart';

class AnnounccementAndnews extends StatelessWidget {
  const AnnounccementAndnews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Duyuru ve Haberler",
          style: TextStyle(color: TobetoAppColor.textColorDark),
        ),
        backgroundColor: TobetoAppColor.colorSchemeLight.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          children: const [
            NatificationCard(),
            SizedBox(
              height: 16,
            ),
            NatificationCard()
          ],
        ),
      ),
    );
  }
}
