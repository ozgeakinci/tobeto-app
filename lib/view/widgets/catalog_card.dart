import 'package:flutter/material.dart';
import 'package:tobeto_app/datas/menu_data.dart';
import 'package:tobeto_app/models/courses.dart';
import 'package:tobeto_app/theme/tobeto_theme.dart';

class CatalogCard extends StatelessWidget {
  final CourseModel course;
  final bool isDarkMode;

  const CatalogCard({Key? key, required this.course, required this.isDarkMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme =
        isDarkMode ? TobetoAppTheme.darkTheme() : TobetoAppTheme.lightTheme();

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: null, //const Icon(Icons.category),
            title: Text(
              course.name,
              style: theme.textTheme.bodyLarge,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Yayınlayan: ${course.instructor}',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  'Süre: ${course.duration}',
                  style: theme.textTheme.bodySmall,
              ),
               Text(
                  'Yayınlanma Tarihi: ${CourseData.formattedDate(course.releaseDate)}',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            'assets/images/video_image.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent, // Arkaplan rengi
              ),
              child: Text(
                'EĞİTİME GİT',
                style: TextStyle(
                  color: theme.colorScheme.primary, // Yazı rengini ayarlayın
                  fontSize: 14, // yazının boyutu
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
