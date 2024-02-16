import 'package:flutter/material.dart';
import 'package:tobeto_app/models/catalog_model.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/screens/video_player.dart';

class CatalogVideoCard extends StatelessWidget {
  const CatalogVideoCard({Key? key, required this.catalogItem})
      : super(key: key);

  final CatalogItem catalogItem;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  catalogItem.videoName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  catalogItem.date!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: ProjectUtilities.projectHeight_8,
                ),
                Image.network(
                  catalogItem.imageURL,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //     VideoApp(videoUrl: department.videoUrl),

          // Margin derini nereden alıyor ?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => LessonVideo(
                          videoUrl: catalogItem.videoUrl,
                        )));
              },
              child: Text(
                "EĞİTİME GİT",
                style: TextStyle(
                    color: isDarkMode
                        ? TobetoAppColor.textColorDark
                        : TobetoAppColor.colorSchemeLight.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
