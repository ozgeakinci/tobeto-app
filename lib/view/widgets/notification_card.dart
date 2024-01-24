import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';

class NatificationCard extends StatelessWidget {
  const NatificationCard({
    Key? key,
    required this.title,
    this.subtitle = "",
    required this.date,
    required this.image,
    this.subImage = "assets/images/time_icon.png",
    this.finishDate = "",
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String date;
  final String image;
  final String subImage;
  final String finishDate;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: isDarkMode
                    ? Colors.grey.withOpacity(0.1)
                    : Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 3),
          ],
          color: isDarkMode
              ? TobetoAppColor.buttonColorDark
              : TobetoAppColor.buttonColorLight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(image), // "assets/images/message_icon.png")
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                      ),
                      if (subtitle.isNotEmpty)
                        Text(
                          subtitle,
                        ),
                    ],
                  )),
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset(subImage),
                      const SizedBox(width: 6),
                      Text(
                        date,
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  if (finishDate.isNotEmpty)
                    Row(
                      children: [
                        Image.asset(subImage),
                        const SizedBox(width: 6),
                        Text(
                          finishDate,
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
