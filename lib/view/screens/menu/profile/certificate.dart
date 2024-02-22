import 'package:flutter/material.dart';
import 'package:tobeto_app/view/screens/menu/profile/skills.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';
import 'package:tobeto_app/view/widgets/skills_card.dart';

class Certificate extends StatelessWidget {
  const Certificate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Sertifikalarım',
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
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
