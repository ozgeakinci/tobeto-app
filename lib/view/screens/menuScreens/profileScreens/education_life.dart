import 'package:flutter/material.dart';
import 'package:tobeto_app/view/screens/menuScreens/profileScreens/skills.dart';
import 'package:tobeto_app/view/widgets/profilimWidget/skills_card.dart';

class EducationLife extends StatelessWidget {
  const EducationLife({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yetkinlik Rozetim'),
      ),
      body: ListView(children: [
        SkillsCard(
            icon: Image.asset("assets/images/education_icon.png"),
            title: const Text('Anadolu Üniversitesi \nWeb Tasarım ve Kodlama'),
            subTitle: const Text("2017/2019"),
            textButton: DeleteButton.deleteIconButton),
        SkillsCard(
            icon: Image.asset("assets/images/education_icon.png"),
            title: const Text('Anadolu Üniversitesi \nİşletme'),
            subTitle: const Text("2012/2014"),
            textButton: DeleteButton.deleteIconButton),
        SkillsCard(
            icon: Image.asset("assets/images/education_icon.png"),
            title: const Text(
                'Çanakkale 18 Mart Üniversitesi \nGıda Teknolojileri'),
            subTitle: const Text("2017/2019"),
            textButton: DeleteButton.deleteIconButton),
      ]),
    );
  }
}
