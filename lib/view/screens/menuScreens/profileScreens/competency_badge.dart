import 'package:flutter/material.dart';
import 'package:tobeto_app/view/widgets/profilimWidget/skills_card.dart';

class CompetencyBadge extends StatelessWidget {
  const CompetencyBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yetkinlik Rozetim'),
      ),
      body: ListView(children: [
        SkillsCard(
          icon: Image.asset("assets/images/badge_coding.png"),
          title: const Text('Herkes için Kodlama'),
          subTitle: const Text("05.10.2023"),
        ),
      ]),
    );
  }
}
