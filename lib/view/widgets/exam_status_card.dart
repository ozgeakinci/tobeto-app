import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/utilities.dart';

class ExamStatusCard extends StatelessWidget {
  const ExamStatusCard(
      {Key? key, required this.point, required this.section, this.icon})
      : super(key: key);

  final String point;
  final String section;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
      ),
      child: Card(
        elevation: 0,
        color: isDarkMode
            ? TobetoAppColor.inputDarkBackground
            : TobetoAppColor.buttonColorLight,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(
              color: TobetoAppColor.inputDarkBackground.withOpacity(0.3),
            )),
        child: Container(
          height: screenWidth * 0.15,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                icon != null
                    ? Expanded(flex: 1, child: icon!)
                    : Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.chevron_right,
                          size: 18,
                          color: isDarkMode
                              ? TobetoAppColor.backgroundLight
                              : TobetoAppColor.backgroundDark,
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
