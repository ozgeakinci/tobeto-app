import 'package:flutter/material.dart';
import 'package:tobeto_app/datas/menu_data.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/view/widgets/educational_card.dart';

class Catalog extends StatelessWidget {
  const Catalog({Key? key}) : super(key: key);

  void catalogAddIcon(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(0.0)),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Filtre',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 12),
                buildBottomSheetOption('Bana Özel'),
                buildBottomSheetOption('Kategori'),
                buildBottomSheetOption('Eğitimler'),
                buildBottomSheetOption('Seviye'),
                buildBottomSheetOption('Konu'),
                buildBottomSheetOption('Yazılım Dili'),
                buildBottomSheetOption('Eğitmen'),
                buildBottomSheetOption('Durum'),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: CourseData.courses.length,
              itemBuilder: (context, index) {
                final course = CourseData.courses[index];
                return EducationalCard(
                  title:
                      "Dinle, Anla, İfade Et: Etkili İletişim Gelişim Yolculuğu",
                  subTitle: "Gürkan İlişen",
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomSheetOption(String title) {
    return InkWell(
      onTap: () {
        print('Tapped $title');
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
