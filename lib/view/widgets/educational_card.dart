// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tobeto_app/models/department_model.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/screens/video_player.dart';

class EducationalCard extends StatelessWidget {
  const EducationalCard({Key? key, required this.department}) : super(key: key);

  final DepartmentLessonModel department;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isDarkMode
              ? TobetoAppColor.inputDarkBackground
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
                  department.videoName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  department.date!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: ProjectUtilities.projectHeight_8,
                ),
                Image.network(
                  department.imageURL,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => LessonVideo(
                          videoTitle: department.videoName,
                          videoUrl: department.videoUrl,
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
