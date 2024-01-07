import 'package:flutter/material.dart';
import 'package:tobeto_app/utilities/utilities.dart';
import 'package:tobeto_app/view/widgets/profilimWidget/skills_card.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yetkinliklerim"),
      ),
      body: ListView(children: [
        SkillsCard(
          title: const Text('JavaScript'),
          textButton: _skillsTextButton(),
        ),
        SkillsCard(
          title: const Text('Uyum Sağlama'),
          textButton: _skillsTextButton(),
        ),
        SkillsCard(
          title: const Text('Aktif Öğrenme'),
          textButton: _skillsTextButton(),
        ),
        SkillsCard(
          title: const Text('Bootstrap(Front-End FrameWork)'),
          textButton: _skillsTextButton(),
        )
      ]),
    );
  }

  TextButton _skillsTextButton() {
    return TextButton(
        onPressed: () {}, child: Image.asset("assets/images/delete_icon.png"));
  }
}
