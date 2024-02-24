import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/view/screens/home/announccementAndnews.dart';
import 'package:tobeto_app/view/screens/home/educations.dart';
import 'package:tobeto_app/view/screens/home/recourses.dart';
import 'package:tobeto_app/view/screens/home/surveys.dart';
import 'package:tobeto_app/view/screens/menu/catalog.dart';
import 'package:tobeto_app/view/screens/menu/profile.dart';
import 'package:tobeto_app/view/screens/menu/profile/tobeto_level_test.dart';
import 'package:tobeto_app/view/screens/menu/reviews.dart';

class BigButton extends StatelessWidget {
  BigButton({
    Key? key,
    required this.title,
    required this.department,
    required this.color,
    Color? textColor,
    this.button,
  })  : textColor = textColor ?? TobetoAppColor.textColor,
        super(key: key);

  final String title;
  final String department;
  final Color color;
  final Color? textColor;
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> routes;

    routes = {
      "Başvurularım": const Recourses(),
      "Eğitimlerim": Educations(department: department),
      "Duyuru ve Haberler": AnnounccementAndnews(
        department: department,
      ),
      "Anketlerim": const Surveys(),
      "Sınavlarım": const TobetoLevelTest(),
      "Profil Oluştur": Profile(),
      "Kendini Değerlendir": Reviews(),
      "Öğrenmeye başla": Catalog()
    };
    return Expanded(
        child: InkWell(
      onTap: () {
        if (routes.containsKey(title)) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => routes[title]!),
          );
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
                style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
