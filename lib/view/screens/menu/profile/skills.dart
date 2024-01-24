import 'package:flutter/material.dart';
import 'package:tobeto_app/view/widgets/skills_card.dart';

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
          textButton: DeleteButton.deleteIconButton,
        ),
        SkillsCard(
          title: const Text('Uyum Sağlama'),
          textButton: DeleteButton.deleteIconButton,
        ),
        SkillsCard(
          title: const Text('Aktif Öğrenme'),
          textButton: DeleteButton.deleteIconButton,
        ),
        SkillsCard(
          title: const Text('Bootstrap(Front-End FrameWork)'),
          textButton: DeleteButton.deleteIconButton,
        )
      ]),
    );
  }
}

class DeleteButton {
  static TextButton deleteIconButton = TextButton(
      onPressed: () {}, child: Image.asset("assets/images/delete_icon.png"));
}
