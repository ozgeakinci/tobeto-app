import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';

class Surveys extends StatelessWidget {
  const Surveys({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  color: TobetoAppColor.colorSchemeLight.primary,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
