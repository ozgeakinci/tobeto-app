import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';

class NatificationCard extends StatelessWidget {
  const NatificationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          color: isDarkMode
              ? TobetoAppColor.buttonColorDark
              : TobetoAppColor.buttonColorLight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/message_icon.png"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Yeni Grupların Discord'a Katılımı",
                  )),
              Row(
                children: [
                  Image.asset("assets/images/time_icon.png"),
                  const SizedBox(width: 6),
                  const Text(
                    "24.12.2023",
                    style: TextStyle(fontWeight: FontWeight.w400),
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
