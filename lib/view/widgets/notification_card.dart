import 'package:flutter/material.dart';
import 'package:tobeto_app/models/notification_model.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/utilities.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    // required this.title,
    // this.subtitle = "",
    // required this.date,
    // required this.image,
    // this.subImage = "assets/images/time_icon.png",
    // this.finishDate = "",
    required this.department,
  }) : super(key: key);

  final NotificationsModel department;
  // final String title;
  // final String subtitle;
  // final String date;
  // final String image;
  // final String subImage;
  // final String finishDate;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return
        //  Column(
        //   children: [
        //     Image.network(
        //       department.image,
        //     ),
        //     Text(department.title),
        //     Text(department.date),
        //   ],
        // );

        Padding(
      padding: EdgeInsets.symmetric(vertical: ProjectUtilities.projectHeight_8),
      child: Container(
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
              child: Image.network(
                  department.image), // "assets/images/message_icon.png")
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(department.title),
                        // if (department.title.isEmpty) Text(department.title),
                      ],
                    )),
                Column(
                  children: [
                    Row(
                      children: [
                        if (department.subImage!.isNotEmpty)
                          Image.network(department.subImage!),
                        const SizedBox(width: 6),
                        Text(
                          department.date,
                          style: const TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    // if (finishDate.isNotEmpty)
                    Row(
                      children: [
                        // Image.asset(subImage),
                        const SizedBox(width: 6),
                        // Text(
                        //   department.title,
                        //   style: const TextStyle(fontWeight: FontWeight.w400),
                        // ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
