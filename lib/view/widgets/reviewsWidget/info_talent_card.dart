import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';

class InfoTalentCard extends StatelessWidget {
  const InfoTalentCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.image})
      : super(key: key);

  final String title;
  final String subtitle;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        height: 333,
        child: Card(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: const Color(0xff7086ff),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(flex: 1, child: image),
                  Expanded(
                    flex: 2,
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: TobetoAppColor.textColorDark),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Text(
                subtitle,
                style: TextStyle(
                    color: TobetoAppColor.textColorDark,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
