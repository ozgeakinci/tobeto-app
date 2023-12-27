import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';

class EducationsListItem extends StatelessWidget {
  const EducationsListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
            ),
          ],
          color: isDarkMode
              ? TobetoAppColor.buttonColorDark
              : TobetoAppColor.buttonColorLight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr. Ecmal Ayral'dan Hoşgeldin Mesajı",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "21 Eylül 2023 15:20",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            // 344 × 258
            'assets/images/video_image.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // Margin derini nereden alıyor ?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "EĞİTİME GİT",
                style: TextStyle(
                  color: TobetoAppColor.colorSchemeLight.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
