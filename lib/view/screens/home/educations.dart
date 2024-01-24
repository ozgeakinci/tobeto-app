import 'package:flutter/material.dart';

import 'package:tobeto_app/view/widgets/educational_card.dart';

class Educations extends StatelessWidget {
  const Educations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Eğitimlerim",
        ),
      ),
      body: ListView(
        children: const [
          EducationalCard(
              title: "Dr. Ecmal Ayral'dan Hoşgeldin Mesajı",
              subTitle: "21 Eylül 2023 15:20"),
          EducationalCard(
              title: "Dr. Ecmal Ayral'dan Hoşgeldin Mesajı",
              subTitle: "21 Eylül 2023 15:20"),
        ],
      ),
    );
  }
}
