import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/view/screens/homeScreens/announccementAndnews.dart';
import 'package:tobeto_app/view/screens/homeScreens/educations.dart';
import 'package:tobeto_app/view/screens/homeScreens/recourses.dart';
import 'package:tobeto_app/view/screens/homeScreens/surveys.dart';

class BigButton extends StatelessWidget {
  BigButton({
    Key? key,
    required this.title,
    required this.color,
    Color? textColor,
  })  : textColor = textColor ?? TobetoAppColor.textColor,
        super(key: key);

  final String title;
  final Color color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: InkWell(
        onTap: () {
          if (title == "Başvurularım") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const Recourses()));
          } else if (title == "Eğitimlerim") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const Educations()));
          } else if (title == "Duyuru ve Haberler") {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => const AnnounccementAndnews()));
          } else if (title == "Anketlerim") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => const Surveys()));
          }
        },
        child: Stack(
          children: [
            Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(20))),
            Padding(
              padding: const EdgeInsets.only(
                top: 35,
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(color: textColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
