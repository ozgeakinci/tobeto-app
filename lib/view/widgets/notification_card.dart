import 'package:flutter/material.dart';
import 'package:tobeto_app/models/notification_model.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/utilities.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    required this.department,
  }) : super(key: key);

  final NotificationsModel department;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ProjectUtilities.projectHeight_8),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: isDarkMode
                ? TobetoAppColor.inputDarkBackground
                : TobetoAppColor.buttonColorLight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/images/message_icon.png'),
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
                      ],
                    )),
                Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/time_icon.png'),
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
                        const SizedBox(width: 6),
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
