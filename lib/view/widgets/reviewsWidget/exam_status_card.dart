import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';

class ExamStatusCard extends StatelessWidget {
  const ExamStatusCard(
      {Key? key,
      required this.point,
      required this.section,
      this.icon = const Icon(
        Icons.chevron_right,
      )})
      : super(key: key);

  final String point;
  final String section;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Card(
        elevation: 0,
        color: isDarkMode
            ? TobetoAppColor.buttonColorDark
            : TobetoAppColor.buttonColorLight,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(
              color: TobetoAppColor.textColor,
            )),
        child: Container(
          height: 55,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    point,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: TobetoAppColor.colorSchemeLight.secondary),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    section,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(flex: 1, child: icon)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
