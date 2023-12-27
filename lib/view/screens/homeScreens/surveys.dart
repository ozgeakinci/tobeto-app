import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';

class Surveys extends StatelessWidget {
  const Surveys({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Anketlerim",
          style: TextStyle(color: TobetoAppColor.backgroundLight),
        ),
        backgroundColor: TobetoAppColor.colorSchemeLight.primary,
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
              "Anket Bulunmamakta!",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "Atanmış herhangi bir anket bulunamadı",
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
