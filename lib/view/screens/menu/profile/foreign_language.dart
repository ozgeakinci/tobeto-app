import 'package:flutter/material.dart';
import 'package:tobeto_app/view/screens/menu/profile/skills.dart';
import 'package:tobeto_app/view/widgets/skills_card.dart';

class ForeignLanguage extends StatelessWidget {
  const ForeignLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yabancı Dillerim'),
      ),
      body: ListView(children: [
        SkillsCard(
            icon: Image.asset("assets/images/world_icon.png"),
            title: const Text('İngilizce'),
            subTitle: const Text("Orta Seviye (B1, B2)"),
            textButton: DeleteButton.deleteIconButton),
      ]),
    );
  }
}
