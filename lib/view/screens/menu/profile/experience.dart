import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';

class Experience extends StatelessWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Deneyimlerim",
          style: TextStyle(color: TobetoAppColor.backgroundLight),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/survey_image.png',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Deneyim Bulunmamakta!",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "Eklenmiş deneyim bulunamadı",
              style: TextStyle(
                  color: isDarkMode
                      ? TobetoAppColor.textColorDark
                      : TobetoAppColor.colorSchemeLight.primary),
            ),
          ],
        ),
      ),
    );
  }
}
