import 'package:flutter/material.dart';
import 'package:tobeto_app/utilities/utilities.dart';

class SkillsCard extends StatelessWidget {
  const SkillsCard(
      {Key? key,
      this.icon,
      this.textButton,
      required this.title,
      this.subTitle})
      : super(key: key);

  final Widget? icon;
  final Text title;
  final Text? subTitle;
  final TextButton? textButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectUtilities.skillsCardPadding,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 0, top: 8, bottom: 8),
          child: ListTile(
              dense: true,
              leading: icon,
              title: title,
              subtitle: subTitle,
              trailing: textButton),
        ),
      ),
    );
  }
}
