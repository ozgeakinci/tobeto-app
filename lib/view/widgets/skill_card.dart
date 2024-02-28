import 'package:flutter/material.dart';
import 'package:tobeto_app/utilities/utilities.dart';

class SkillCard extends StatelessWidget {
  const SkillCard(
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
          padding: EdgeInsets.only(
              left: ProjectUtilities.sizeWidth_8,
              right: 0,
              top: ProjectUtilities.projectHeight_8,
              bottom: ProjectUtilities.projectHeight_8),
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
