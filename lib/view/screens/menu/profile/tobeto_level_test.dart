import 'package:flutter/material.dart';
import 'package:tobeto_app/theme/tobeto_theme_color.dart';
import 'package:tobeto_app/view/widgets/custom_appbar.dart';

import 'package:tobeto_app/view/widgets/skills_card.dart';

class TobetoLevelTest extends StatelessWidget {
  const TobetoLevelTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Tobeto Seviye Testlerim',
      ),
      body: ListView(children: [
        SkillsCard(
          icon: Text(
            "84.00",
            style: CardTextStyle.textStyle,
          ),
          title: const Text('Front-End'),
          subTitle: const Text("05.10.2023"),
        ),
        SkillsCard(
          icon: Text(
            "68.00",
            style: CardTextStyle.textStyle,
          ),
          title: const Text('Herkes için kodlama'),
          subTitle: const Text("05.10.2023"),
        ),
      ]),
    );
  }
}

class CardTextStyle {
  static TextStyle textStyle = TextStyle(
      color: TobetoAppColor.colorSchemeLight.secondary,
      fontSize: 16,
      fontWeight: FontWeight.bold);
}
