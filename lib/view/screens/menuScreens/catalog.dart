import 'package:flutter/material.dart';
import 'package:tobeto_app/datas/menu_data.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/view/widgets/educational_card.dart';

class Catalog extends StatelessWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TobetoAppColor.colorSchemeLight.primary,
        title: Text(
          'Katalog',
          style: TextStyle(
            color: TobetoAppColor.textColorDark, // Yazı rengi
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Burada arama işlemleri gerçekleştirilebilir
            },
            icon: Icon(Icons.search), // Arama simgesi
          ),
          IconButton(
            onPressed: () {
              // Filtreleme işlemleri burada gerçekleştirilebilir
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(0.0)),
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
                            'Filtre', // Başlık
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // Kalın font
                              fontSize: 20, // Metin boyutu
                            ),
                          ),
                          const SizedBox(
                              height:
                                  12), // Başlık ile seçenekler arasında boşluk bırakmak için
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
            },
            icon: Icon(Icons.filter_list_alt), //filtre simgesi
          ),
        ],
      ),
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
                    subTitle: "Gürkan İlişen");
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
        // Seçeneğe tıklama işlemleri
        print('Tapped $title');
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            16, 12, 16, 12), // Kenar boşlukları ayarlandı
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
            const Icon(Icons.chevron_right), // Seçeneklerin yanındaki sembol
          ],
        ),
      ),
    );
  }
}
