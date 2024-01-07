import 'package:flutter/material.dart';
import 'package:tobeto_app/view/screens/menuScreens/profileScreens/skills.dart';
import 'package:tobeto_app/view/widgets/profilimWidget/skills_card.dart';

class Certificate extends StatelessWidget {
  const Certificate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sertifikalarım'),
      ),
      body: ListView(children: [
        SkillsCard(
            icon: Image.asset("assets/images/world_icon.png"),
            title: const Text('Open Engilish Certificate'),
            subTitle: const Text("2023"),
            textButton: DeleteButton.deleteIconButton),
        SkillsCard(
            icon: Image.asset("assets/images/world_icon.png"),
            title: const Text('Bilge Adam Başarı Sertifikası'),
            subTitle: const Text("2023"),
            textButton: DeleteButton.deleteIconButton),
      ]),
    );
  }
}
