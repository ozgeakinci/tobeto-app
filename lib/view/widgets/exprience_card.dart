import 'package:flutter/material.dart';
import 'package:tobeto_app/utilities/utilities.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard(
      {Key? key,
      this.icon,
      this.textButton,
      required this.title,
      this.subTitle,
      this.startDate,
      this.finishDate})
      : super(key: key);

  final Widget? icon;
  final Text title;
  final Text? subTitle;
  final Text? startDate;
  final Text? finishDate;
  final TextButton? textButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectUtilities.skillsCardPadding,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(
                style: BorderStyle.solid,
                color: Color.fromARGB(255, 221, 221, 221))),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 0, top: 8, bottom: 8),
          child: ListTile(
              dense: true,
              leading: icon,
              title: title,
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  subTitle ?? SizedBox.shrink(),
                  startDate ?? SizedBox.shrink(),
                  startDate ?? SizedBox.shrink(),
                ],
              ),
              trailing: textButton),
        ),
      ),
    );
  }
}
